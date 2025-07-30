contract Test {
    a: Int as int4;
    b: Int as uint1;
    c: Int as uint16;
    d: Int as int64;

    init() {
        self.a = 2;
        self.b = 1;
        self.c = 42;
        self.d = -123456789;
    }
}
