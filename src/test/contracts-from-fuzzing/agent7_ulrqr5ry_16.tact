contract TestStringCurlyUnicode {
    receive() {
        // Test: Unicode escape sequence with curly braces for a single character
        let s: String = "\u{61}"; // Expected to produce "a"
        let expected: String = "a";

        // Test equality via asSlice conversion
        let isEqual: Bool = s.asSlice() == expected.asSlice();
    }
}
