contract TestUnicodeEscape {
    // Test Unicode escape sequence in string literal
    receive() {
        let s: String = "A\u0042C"; // Expecting "ABC"
        let sl: Slice = s.asSlice();
        let s2: String = sl.asString();
    }
}
