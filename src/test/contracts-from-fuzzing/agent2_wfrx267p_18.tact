contract Test {
    receive() {
        // Test valid maximum Unicode code point using \u{} escape: 0x10FFFF
        let s: String = "\u{10FFFF}";  // This should be valid as 0x10FFFF is the maximum valid Unicode code point
        let h: Int = s.hashData();
        let dummy: Int = h;
    }
}
