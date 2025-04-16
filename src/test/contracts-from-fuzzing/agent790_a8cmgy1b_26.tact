contract SerializeIntVariants {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as uint12;
    d: Int as uint24;
    e: Int as uint32;
    f: Int as uint64;
    g: Int as uint128;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
        self.f = 6;
        self.g = 7;
    }
}
