contract IntWidths {
    a: Int as uint4;    // 4 bits unsigned
    b: Int as int8;    // 8 bits signed
    c: Int as uint32;  // 32 bits unsigned
    d: Int as int64;   // 64 bits signed
    e: Int as uint120; // large unsigned
    f: Int as int257;  // full size signed

    init() {
        self.a = 5;
        self.b = -5;
        self.c = 123456;
        self.d = -123456789;
        self.e = 1234567890123456789012345;
        self.f = -123456789012345678901234567890;
    }
}
