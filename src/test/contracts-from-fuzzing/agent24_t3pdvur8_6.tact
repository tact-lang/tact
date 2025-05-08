contract Test {
    receive() {
         // Test string literal with comprehensive escape sequences
         let s: String = "Backslash: \\; Quote: \"; Newline: \n; Carriage: \r; Tab: \t; Vertical: \v; Backspace: \b; FormFeed: \f; Hex: \x41; Unicode (4-digit): \u0041; Unicode (variable): \u{1F602}";
         dump(s);
    }
}
