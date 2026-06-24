contract TestMoon() {
    fun test() {
        dump(MOON_RADIUS_KM); // expected: 1738
    }
}

const MOON_RADIUS_KM: Int = 1730 + (8 | 8);