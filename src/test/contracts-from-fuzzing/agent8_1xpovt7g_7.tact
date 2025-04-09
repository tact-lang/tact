contract TestMoonRadius() {
    // Test constant evaluation for an expression combining literals and bitwise operations.
    // As per the documentation, MOON_RADIUS_KM is defined as 1730 + (8 | 8) and should equal 1738.
    const MR: Int = 1730 + (8 | 8);

    receive() {
        require(self.MR == 1738, "moon radius constant mismatch");
        cashback(sender());
    }
}
