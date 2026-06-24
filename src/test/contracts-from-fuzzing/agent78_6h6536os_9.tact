contract TestUnicodeBrace {
    // Test Unicode escape sequence in the { } form (e.g., for emoji)
    receive() {
        let s: String = "Smile: \u{1F600}"; // expecting the Unicode character U+1F600 (grinning face)
    }
}
