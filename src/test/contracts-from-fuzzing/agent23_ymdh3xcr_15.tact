contract TestMaxUnicode {
    receive() {
        // Testing maximum valid Unicode code point (U+10FFFF)
        dump("Max code point: \u{10FFFF}");
    }
}
