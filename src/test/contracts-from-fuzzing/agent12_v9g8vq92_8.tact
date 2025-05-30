contract TestContract {
    // Test 5: String literal with Unicode escape sequence using \u{} syntax
    receive() {
        let s: String = "Emoji: \u{1F600}"; // 😀
    }
}
