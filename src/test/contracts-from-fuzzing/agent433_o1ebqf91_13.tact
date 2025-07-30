contract VariousSizes {
    a: Int as int8;
    b: Int as uint32;
    c: Int as int64;
    d: Int as uint128;
    e: Int as int257;

    init() {
        self.a = 12;
        self.b = 123456;
        self.c = -987654321;
        self.d = 123456789012345;
        self.e = -1;
    }
}