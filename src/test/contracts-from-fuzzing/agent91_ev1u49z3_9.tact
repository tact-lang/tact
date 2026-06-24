contract TestUnicodeEscape {
    receive() {
        // Testing Unicode escape sequence using \u{} syntax
        let s: String = "\u{1F525}";  // fire emoji
        let _ = s.asSlice();
    }
}
