contract Test {
    receive() {
        // Test valid Unicode escape sequences using \u{} notation
        let s: String = "\u{1F602} LOL \u{1F602}";
    }
}
