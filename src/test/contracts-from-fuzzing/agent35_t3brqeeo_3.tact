contract Test3 {
    // Compile-time evaluation of constant expressions
    // Expected: 1730 + (8 | 8) = 1730 + 8 = 1738
    const MOON_RADIUS_KM: Int = 1730 + (8 | 8);

    get fun getRadius(): Int {
        return self.MOON_RADIUS_KM;
    }
}
