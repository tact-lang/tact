contract TestContract {
    receive() {
        // Test all escape sequences in one string literal
        let s: String = "Backslash: \\; Double quote: \"; Newline: \n; Carriage: \r; Tab: \t; Vertical tab: \v; Backspace: \b; Form feed: \f; Hex: \x22; Unicode: \u263A; Unicode block: \u{1F602}";
    }
}
