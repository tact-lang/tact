contract IntSerializations {
    a: Int as uint1;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
    e: Int as int64;
    f: Int as uint128;
    g: Int as int257;

    init() {
        self.a = 1;
        self.b = 255;
        self.c = -1234;
        self.d = 123456;
        self.e = -9999;
        self.f = 123456789012345678901234567890;
        self.g = -1;
    }
}