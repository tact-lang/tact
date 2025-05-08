contract IntSizes {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;

    init() {
        self.a = 255;
        self.b = -32000;
        self.c = 4000000000;
        self.d = 100000000000;
        self.e = 123456789012345678901234567890;
    }
}