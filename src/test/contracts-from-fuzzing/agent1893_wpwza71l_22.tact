contract IntSizes {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
    e: Int as int64;
    f: Int as uint128;
    g: Int;

    init() {
        self.a = -10;
        self.b = 10;
        self.c = -100;
        self.d = 100;
        self.e = -1000;
        self.f = 1000;
        self.g = -10000;
    }
}