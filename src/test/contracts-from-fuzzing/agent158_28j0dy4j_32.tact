contract IntVariants {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint256;

    init() {
        self.a = 255;
        self.b = -12345;
        self.c = 1234567890;
        self.d = -9876543210;
        self.e = 0xffffffffffffffffffffffff;
    }
}