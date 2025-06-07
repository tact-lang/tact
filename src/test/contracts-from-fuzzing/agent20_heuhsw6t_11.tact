contract TestSelfLiteral {
    const MOON_RADIUS_KM: Int = 1738;

    fun showcase() {
        // Testing self literal accessing contract-level constant
        dump(self.MOON_RADIUS_KM); // expected: 1738
        dump(self.MOON_RADIUS_KM.toString()); // expected: "1738"
    }

    receive() {
        self.showcase();
    }
}
