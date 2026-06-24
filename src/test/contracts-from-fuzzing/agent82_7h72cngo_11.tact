contract TestUnicodeEscape {
    receive() {
        // Test valid Unicode escape sequence in string literal
        let s: String = "Smile: \u{1F600}";
    }
}
