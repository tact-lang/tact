contract Test {
    receive() {
        // Test 10: Valid unicode escape using \u{...}
        let s: String = "\u{1F602} laughing emoji";
    }
}
