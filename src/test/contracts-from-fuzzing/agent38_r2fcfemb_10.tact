contract Test {
    receive() {
        // Testing Unicode escape sequence with variable length hex digits: \u{...}
        let s: String = "Emoji: \u{1F602}";
    }
}
