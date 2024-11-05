import SwiftUI

public enum PinputStyle {
    case style1
    case style2
    case style3
    case style4
    case style5
}

@available(iOS 15.0, *)
@available(macOS 12.0, *)
public struct SwiftPinput: View {
    
    private enum FocusField: Hashable {
        case otpField
    }
    
    @FocusState private var focusedField: FocusField?
    
    @Binding private var otpCode: String
    private let otpCodeLength: Int
    private let fieldWidth: CGFloat
    private let fieldHeight: CGFloat
    private let cornerRadius: CGFloat
    private let font: Font
    private let borderColor: Color
    private let activeBorderColor: Color
    private let inactiveBackgroundColor: Color
    private let activeBackgroundColor: Color
    private let textColor: Color
    private let style: PinputStyle
    private let onCompletion: ((String) -> Void)?
    
    public init(
        otpCode: Binding<String>,
        otpCodeLength: Int = 4,
        fieldWidth: CGFloat = 48,
        fieldHeight: CGFloat = 48,
        cornerRadius: CGFloat = 12,
        font: Font = .title,
        borderColor: Color = .primary,
        activeBorderColor: Color = .accentColor,
        activeBackgroundColor: Color = .accentColor.opacity(0.1),
        inactiveBackgroundColor: Color = .gray.opacity(0.2),
        textColor:Color = .primary,
        style: PinputStyle = .style1,
        onCompletion: ((String) -> Void)? = nil
    ) {
        self._otpCode = otpCode
        self.otpCodeLength = min(max(otpCodeLength, 1), 8)
        self.fieldWidth = fieldWidth
        self.fieldHeight = fieldHeight
        self.cornerRadius = cornerRadius
        self.font = font
        self.borderColor = borderColor
        self.activeBorderColor = activeBorderColor
        self.activeBackgroundColor = activeBackgroundColor
        self.inactiveBackgroundColor = inactiveBackgroundColor
        self.textColor = textColor
        self.style = style
        self.onCompletion = onCompletion
    }
    
    public var body: some View {
        VStack {
            ZStack {
                HStack(spacing: 8) {
                    ForEach(0..<otpCodeLength, id: \.self) { index in
                        otpText(text: otpDigit(at: index), index: index)
                            .foregroundColor(otpCode.count == index ? activeBorderColor : borderColor)
                    }
                }
                
                // Invisible TextField for OTP input
                TextField("", text: $otpCode)
                    .frame(width: 0, height: 0)
                    .textContentType(.oneTimeCode)
                    .focused($focusedField, equals: .otpField)
                    .foregroundColor(.clear)
                    .accentColor(.clear)
                    .background(Color.clear)
#if os(iOS)
                    .keyboardType(.numberPad)
#endif
                    .onChange(of: otpCode) { newValue in
                        let filteredValue = newValue.filter { $0.isNumber }
                        otpCode = String(filteredValue.prefix(otpCodeLength))
                        
                        if otpCode.count == otpCodeLength {
                            onCompletion?(otpCode)
                        }
                    }
            }
        }
        .onAppear {
            focusedField = .otpField
        }
    }

    private func otpText(text: String, index: Int) -> some View {
        let digit = text.filter { $0.isNumber }

        return Text(digit)
            .font(font)
            .foregroundColor(textColor)
            .frame(width: fieldWidth, height: fieldHeight)
            .background(style != PinputStyle.style1
                             ? (otpCode.count == index ? activeBackgroundColor : inactiveBackgroundColor)
                             : Color.clear)
            .cornerRadius(cornerRadius)
            .overlay(
                Group {
                    switch style {
                    case .style1:
                        // Style 1: Line at the bottom
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .frame(width: nil, height: 2, alignment: .bottom)
                            .foregroundColor(otpCode.count == index ? activeBorderColor : borderColor)

                    case .style2:
                        // Style 2: Rounded border around the field
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(otpCode.count == index ? activeBorderColor : borderColor, lineWidth: 2)

                    case .style3:
                        Color.clear

                    case .style4:
                        RoundedRectangle(cornerRadius: 0)
                            .frame(height: 2)
                            .foregroundColor(otpCode.count == index ? activeBorderColor : .clear)
                            
                           
                    case .style5:
                        // Style 6: Gradient background
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [activeBackgroundColor, inactiveBackgroundColor]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: cornerRadius)
                                    .stroke(otpCode.count == index ? activeBorderColor : borderColor, lineWidth: 2)
                            )
                    }
                },
                alignment: .bottom
            )
            .onTapGesture {
                focusedField = .otpField
            }
    }
    
    private func otpDigit(at index: Int) -> String {
        guard index < otpCode.count else { return "" }
        return String(Array(otpCode)[index])
    }
}


