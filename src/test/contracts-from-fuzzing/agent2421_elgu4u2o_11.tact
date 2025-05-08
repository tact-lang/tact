contract BigNumbers {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;
    f: Int as int257;

    init() {
        self.a = 1;
        self.b = -32;
        self.c = 1234;
        self.d = -12345;
        self.e = 12345678901234567890;
        self.f = -123456789012345678901234567890;
    }
}