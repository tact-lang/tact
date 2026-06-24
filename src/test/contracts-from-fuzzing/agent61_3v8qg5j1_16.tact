contract Test {
    receive() {
        // Test: Using hashData on a unicode emoji (rocket) string
        // The string should have a number of bits divisible by 8
        let h: Int = "\u{1F680}".hashData();
        dump(h);
    }
}
