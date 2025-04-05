contract Test {
    // Contract-level constant evaluated at compile time, expected to be 1730 + (8 | 8) = 1738
    const MOON_RADIUS: Int = 1730 + (8 | 8);

    receive() {
        // Dump the constant; expected output: 1738
        dump(self.MOON_RADIUS);
        cashback(sender());
    }
}
