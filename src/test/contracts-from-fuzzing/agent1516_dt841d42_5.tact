contract Test {
    a: Int as uint8;
    b: Int as uint32;
    c: Int as int64;
    d: Int as uint128;
    e: Int as int257;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
    }
}