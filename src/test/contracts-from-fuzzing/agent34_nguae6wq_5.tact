contract Test {
    receive() {
        // Test valid unicode escape sequence using \u{1F602} and double quote escape
        let s: String = "Emoji: \u{1F602}, Quote: \"Test\"";
    }
}
