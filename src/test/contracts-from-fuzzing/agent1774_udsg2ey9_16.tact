contract Test {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint128;
    d: Int as int257;

    init() {
        self.a = 0;
        self.b = 0;
        self.c = 0;
        self.d = 0;
    }
}