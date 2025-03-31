contract Test {
    receive() {
        // Test empty string literal and a string with an emoji using a Unicode escape
        let empty: String = "";
        let emoji: String = "\u{1F600}"; // Grinning face emoji
    }
}
