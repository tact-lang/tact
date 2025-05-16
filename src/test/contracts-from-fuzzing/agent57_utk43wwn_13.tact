contract Test {
    receive() {
        // Test G: Using a valid Unicode escape sequence
        // The Unicode escape should convert the code point 1F600 (grinning face) to the corresponding character
        let s: String = "Smiley: \u{1F600}";
        dump(s);
    }
}
