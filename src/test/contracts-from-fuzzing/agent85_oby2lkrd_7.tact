contract Test {
    receive() {
        // Test: Using various escape sequences in a single string literal
        let s: String = "Emoji: \u{1F602}, Unicode: \u26A1, hex: \x41, Newline:\n, Tab:\t, Quote: \", Backslash: \\";
        dump(s);
    }
}
