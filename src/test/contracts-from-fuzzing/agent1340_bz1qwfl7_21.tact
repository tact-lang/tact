contract UintSerialization {
    small: Int as uint4;
    big: Int as uint128;

    init() {
        self.small = 7;
        self.big = 123456789123456789;
    }
}