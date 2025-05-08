contract TestMoonRadius() {
    // Testing compile-time arithmetic and bitwise operations in constant expressions
    // According to documentation, 1730 + (8 | 8) should equal 1738
    const MOON_RADIUS_KM: Int = 1730 + (8 | 8);

    fun runTest() {
        dump(self.MOON_RADIUS_KM == 1738);
    }

    receive() {
        self.runTest();
        cashback(sender());
    }
}
