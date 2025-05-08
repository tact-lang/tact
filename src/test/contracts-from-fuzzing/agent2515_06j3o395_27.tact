contract VariousSer {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint256;
    f: Int;
    init() {
        self.a = 8;
        self.b = -5;
        self.c = 123456;
        self.d = -987654;
        self.e = pow(2, 200);
        self.f = -1;
    }
}
