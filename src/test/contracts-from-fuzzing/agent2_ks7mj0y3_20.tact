contract Test {
    receive() {
        let largeUnicode: String = "Emoji: \u{10FFFF}"; // Max valid Unicode codepoint
    }
}