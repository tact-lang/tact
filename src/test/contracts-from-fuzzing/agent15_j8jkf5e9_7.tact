contract TestConstEval() {
    // Evaluate a constant expression that involves arithmetic and bitwise operators
    // According to documentation, 8 | 8 is 8, so 1730 + (8 | 8) should evaluate to 1738
    const MOON_RADIUS_KM: Int = 1730 + (8 | 8);

    fun test() {
        dump(self.MOON_RADIUS_KM);  // Expect output: 1738
    }

    receive() {
        self.test();
        cashback(sender());
    }
}
