contract SerializeVariousInts {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
    e: Int as int64;
    f: Int as uint128;

    init() {
        self.a = 3;
        self.b = 7;
        self.c = -10;
        self.d = 60;
        self.e = -4000;
        self.f = 123456789;
    }
}