contract TestConstEval() {
    // Testing constant evaluation of arithmetic and bitwise operators
    const MOON_RADIUS_KM: Int = 1730 + (8 | 8); // expected: 1738

    fun run() {
        dump(self.MOON_RADIUS_KM.toString());
    }

    receive() {
        self.run();
    }
}
