contract ConstTest() {
    // Constant expression using operator precedence and bitwise operator
    const MOON_RADIUS_KM: Int = 1730 + (8 | 8); // Expected: 1738

    get fun get_moon_radius() : Int {
        return self.MOON_RADIUS_KM;
    }

    receive() {
        // Do nothing
    }
}
