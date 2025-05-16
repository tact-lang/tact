contract TestMoonRadius() {
    // Test compile-time evaluation of constant arithmetic using built-in operators
    // According to documentation: const MOON_RADIUS_KM: Int = 1730 + (8 | 8);
    // (8 | 8) should equal 8, so MOON_RADIUS_KM is expected to be 1738
    const MOON_RADIUS_KM: Int = 1730 + (8 | 8);

    receive() {
        dump(self.MOON_RADIUS_KM); // expected output: 1738
        cashback(sender());
    }
}
