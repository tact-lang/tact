contract IntBounds {
    small: Int as int8;
    big: Int as uint256;
    init() {
        self.small = -128;
        self.big = 115792089237316195423570985008687907853269984665640564039457584007913129639935;
    }
}