contract TestMaxUnicode {
    receive() {
        // Testing boundary Unicode escape: maximum valid Unicode code point (U+10FFFF)
        "Max Unicode: \u{10FFFF}";
    }
}
