contract TestUnicodeChar {
    receive() {
        // Test a Unicode escape for the copyright symbol U+00A9
        let s: String = "\u00A9 Copyright";
        let s2: String = s.asSlice().asString();
        require(s == s2, "Unicode conversion error");
    }
}
