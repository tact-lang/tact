contract IntTypes {
    a: Int as uint1;
    b: Int as uint4;
    c: Int as uint8;
    d: Int as uint16;
    e: Int as int32;
    f: Int as int64;
    g: Int as int128;
    h: Int as coins;

    init() {
        self.a = 1;
        self.b = 15;
        self.c = 255;
        self.d = 65535;
        self.e = 123456;
        self.f = -9876543210;
        self.g = 123456789012345;
        self.h = ton("123");
    }
}