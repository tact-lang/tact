contract SerialTest {
    small: Int as uint8;
    medium: Int as int32;
    big: Int as uint128;
    full: Int; // 257-bit

    init() {
        self.small = 1;
        self.medium = -123;
        self.big = 100000;
        self.full = -999999;
    }
}