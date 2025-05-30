contract TestAllEscapes {
    receive() {
        // Testing all valid escape sequences in a single string literal
        let s: String = "Backslash: \\; Quote: \"; Newline: \n; Carriage: \r; Tab: \t; Vertical: \v; Backspace: \b; Formfeed: \f; Hex: \x41; Unicode short: \u0041; Unicode long: \u{1F4A9}";
    }
}
