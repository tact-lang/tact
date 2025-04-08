contract LargeInts {
    a: Int as uint32;
    b: Int as int64;
    c: Int as uint128;
    d: Int as int251;
    e: Int as uint1;
    f: Int as int257;
    init() {
        self.a = 1;
        self.b = -2;
        self.c = 3;
        self.d = -4;
        self.e = 1;
        self.f = 5;
    }
}