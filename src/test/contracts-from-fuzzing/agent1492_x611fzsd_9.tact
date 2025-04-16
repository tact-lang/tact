contract LongIntFields {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;
    f: Int as int256;

    init() {
        self.a = 255;
        self.b = -32000;
        self.c = 1234567890;
        self.d = -1234567890123;
        self.e = 123456789012345678901234567890;
        self.f = -1234567890123456789012345678901234567890;
    }
}