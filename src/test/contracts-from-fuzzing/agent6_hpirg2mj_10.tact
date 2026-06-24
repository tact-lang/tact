contract TestUnicodeEscape {
    receive() {
        // Test string literal with Unicode escape sequence
        let s: String = "Unicode: \u{1F600}"; // Grinning face emoji
        let comment: Cell = s.asComment();
        return;
    }
}
