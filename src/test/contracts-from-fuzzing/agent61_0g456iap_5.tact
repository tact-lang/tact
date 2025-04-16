const MOON_RADIUS: Int = 1730 + (8 | 8);

contract TestMoon() {
    get fun getMoon(): Int {
        // Expected: 1730 + (8 | 8) = 1730 + 8 = 1738
        return MOON_RADIUS;
    }
}
