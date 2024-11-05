
# SwiftPinput

`SwiftPinput` is a customizable SwiftUI component for OTP (One-Time Password) input fields. This package allows you to add sleek, user-friendly OTP input fields to your iOS and macOS apps, with various styles and customization options.


https://github.com/user-attachments/assets/c61d5a94-ab32-40c4-8d6b-1b44de84971b


## Features

- Support for different OTP field styles
- Customizable field dimensions, colors, fonts, and corner radius
- Built-in onCompletion callback for when OTP input is complete
- Supports iOS 15.0+ and macOS 12.0+

## Installation

Swift Package Manager (SPM)
To install the ScrollableTabView using Swift Package Manager, follow these steps:

1. Open your Xcode project.

2. Go to File > Add Packages.

3. In the search bar, paste the following URL:

```bash
https://github.com/hadiuzzaman524/SwiftPinput.git

```
4. Select the package and click Add Package to integrate it into your project.
## Usage

### Basic Example

Here’s a simple example of how to use `SwiftPinput` in your SwiftUI project:

```swift
import SwiftUI
import SwiftPinput

struct ContentView: View {
    @State private var otpCode = ""

    var body: some View {
        SwiftPinput(
            otpCode: $otpCode,
            onCompletion: { code in
                print("OTP Code entered: \(code)")
            }
        )
    }
}
```

### Customizing the OTP Input Fields

You can customize `SwiftPinput` with various parameters:

- **otpCode**: Binding to the OTP code entered by the user.
- **otpCodeLength**: Sets the length of the OTP code (default is 4).
- **fieldWidth** and **fieldHeight**: Set the width and height of each OTP input field.
- **cornerRadius**: Sets the corner radius of the OTP fields.
- **font**: Font for the OTP text.
- **borderColor** and **activeBorderColor**: Colors for the field border in inactive and active states.
- **inactiveBackgroundColor** and **activeBackgroundColor**: Background colors for the OTP fields in inactive and active states.
- **textColor**: Color of the OTP text.
- **style**: Style for the OTP input fields, supporting five styles (`style1`, `style2`, `style3`, `style4`, `style5`).
- **onCompletion**: A callback that triggers once the OTP input is complete.

### Style Options

You can choose from the following styles for OTP fields:

- **style1**: Line at the bottom of the field.
- **style2**: Rounded border around the field.
- **style3**: No border, minimalistic style.
- **style4**: Underline without rounded corners.
- **style5**: Gradient background with a rounded border.

#### Example with Customization

```swift
SwiftPinput(
    otpCode: $otpCode,
    otpCodeLength: 6,
    fieldWidth: 50,
    fieldHeight: 50,
    cornerRadius: 10,
    font: .title2,
    borderColor: .gray,
    activeBorderColor: .blue,
    activeBackgroundColor: .blue.opacity(0.2),
    inactiveBackgroundColor: .gray.opacity(0.1),
    textColor: .primary,
    style: .style2,
    onCompletion: { code in
        print("OTP entered: \(code)")
    }
)
```

## Requirements

- iOS 15.0+ or macOS 12.0+
- Swift 5.5+

## License

This package is available under the MIT license. See the LICENSE file for more info.

--- 
