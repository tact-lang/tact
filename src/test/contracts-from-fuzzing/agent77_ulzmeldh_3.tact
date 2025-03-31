contract Test {
    receive() {
        // Test escape sequences: newline, tab, backslash, double quote, and Unicode emoji
        let s: String = "Hello\nWorld!\tThis is a backslash: \\ and a double quote: \" followed by emoji: \u{1F600}";
    }
}
