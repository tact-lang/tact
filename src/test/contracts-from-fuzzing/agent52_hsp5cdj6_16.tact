contract Test {
    receive() {
        // Testing the maximum valid Unicode code point (0x10FFFF)
        dump("edge: \u{10FFFF}");
    }
}
