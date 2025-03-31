contract TestUnicodeEscape {
    receive() {
        // Test a Unicode escape sequence (fire emoji U+1F525) in a string literal
        let s: String = "Fire: \u{1F525}";
    }
}
