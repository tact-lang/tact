contract TestContract {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;
    f: Int; // default 257-bit signed

    init() {
        self.a = 1;
        self.b = -2;
        self.c = 3;
        self.d = -4;
        self.e = 5;
        self.f = -6;
    }
}
