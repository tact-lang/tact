contract TestBitwise {
    // Test constant evaluation involving bitwise operator.
    // According to documentation, const MOON_RADIUS_KM should be 1730 + (8 | 8) = 1738.
    const MOON_RADIUS_KM: Int = 1730 + (8 | 8);

    receive() {
        let radius = self.MOON_RADIUS_KM;
        dump(radius);
    }
}
