contract SerializeBits {
    small: Int as uint3;
    other: Int as int7;
    big: Int as uint64;
    init() {
        self.small = 5;
        self.other = -10;
        self.big = 123456789;
    }
}