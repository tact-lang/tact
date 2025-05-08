contract DifferentSerialization {
    a: Int as int1;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
    e: Int as int64;
    f: Int;

    init() {
        self.a = 1;
        self.b = 255;
        self.c = -12345;
        self.d = 123456789;
        self.e = -9876543210;
        self.f = 12345678901234567890;
    }
}