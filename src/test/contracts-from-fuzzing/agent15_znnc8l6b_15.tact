contract Test {
    receive() {
        // Testing maximum valid Unicode code point (U+10FFFF)
        let s: String = "Max valid: \u{10FFFF}";
    }
}
