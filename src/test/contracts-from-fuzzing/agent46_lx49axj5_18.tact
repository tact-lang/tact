contract TestMinUnicodeEscape {
    receive() {
        // Test using the minimum allowed Unicode escape: U+0000
        // Expected to compile successfully, yielding a string with a single null character
        let s: String = "\u{0}";
        let sl: Slice = s.asSlice();
        sl;
    }
}
