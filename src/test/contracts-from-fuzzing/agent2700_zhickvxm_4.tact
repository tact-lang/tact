contract UIntVariants {
    a: Int as uint1;
    b: Int as uint4;
    c: Int as uint8;
    d: Int as uint32;
    e: Int as uint64;
    f: Int as uint128;
    g: Int as uint256;

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