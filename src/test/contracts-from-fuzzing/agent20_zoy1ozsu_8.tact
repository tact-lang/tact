contract Test {
    receive() {
        // Test Unicode escape sequence using \u{1F600} (grinning face emoji)
        let s: String = "Emoji: \u{1F600}";
    }
}
