contract TestMaxValidUnicode {
    // Test using the maximum valid Unicode code point (U+10FFFF)
    receive() {
        let s: String = "\u{10FFFF}";
        let sl: Slice = s.asSlice();
        sl;
    }
}
