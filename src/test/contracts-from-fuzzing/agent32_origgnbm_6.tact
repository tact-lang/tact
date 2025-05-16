contract TestUnicodeString {
    receive() {
        // Test a string literal with Unicode escape sequences
        let s: String = "\u{1F602} LOL \u{1F602}"; // Should represent the 😂 emoji followed by LOL and another 😂
        self.reply(s.asComment());
    }
}
