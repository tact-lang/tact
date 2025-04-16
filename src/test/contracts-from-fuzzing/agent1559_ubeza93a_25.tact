contract SerializeLargeInt {
    big: Int as uint256;

    init() {
        self.big = 340282366920938463463374607431768211455; // 2^128 - 1
    }
}