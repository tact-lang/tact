contract TestStringEscape {
    receive() {
        // Test various escape sequences in a string literal
        let s: String = "Line1\nLine2\tTabbed \"quote\" and backslash: \\ and hex: \x41";
        self.reply(s.asComment());
    }
}
