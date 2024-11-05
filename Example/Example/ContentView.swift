import SwiftUI
import SwiftPinput

struct ContentView: View {
    @State private var otpCode1 = ""
    @State private var otpCode2 = ""
    @State private var otpCode3 = ""
    @State private var otpCode4 = ""
    @State private var otpCode5 = ""
    @State private var otpCode6 = ""
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Style 1: Bottom Line")
            SwiftPinput(
                otpCode: $otpCode1,
                activeBackgroundColor: .yellow,
                inactiveBackgroundColor: .gray.opacity(0.2),
                style: .style1
            )
            
            Text("Style 2: Rounded Border")
            SwiftPinput(
                otpCode: $otpCode2,
                otpCodeLength: 5,
                style: .style2
            )
            
            Text("Style 3: Star Background")
            SwiftPinput(
                otpCode: $otpCode3,
                otpCodeLength: 6,
                activeBackgroundColor: .blue,
                inactiveBackgroundColor: .gray.opacity(0.3),
                style: .style3
            )
            
            Text("Style 4: Underline")
            SwiftPinput(
                otpCode: $otpCode4,
                otpCodeLength: 6,
                inactiveBackgroundColor: .gray.opacity(0.4),
                style: .style4
            )
            
            Text("Style 5: Circular with Shadows")
            SwiftPinput(
                otpCode: $otpCode5,
                activeBorderColor: .red,
                activeBackgroundColor: .red,
                inactiveBackgroundColor: .white.opacity(0.2),
                style: .style5
            )
            
        }
        .padding()
    }
}
