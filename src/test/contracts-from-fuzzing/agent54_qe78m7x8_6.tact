contract TestMoonRadius {
    // Test compile-time evaluation of constant expressions
    // Expected: 1730 + (8 | 8) equals 1738
    const MOON_RADIUS_KM: Int = 1730 + (8 | 8);

    receive() {
        require(self.MOON_RADIUS_KM == 1738, "MOON_RADIUS_KM constant evaluation failed");
        cashback(sender());
    }
}
