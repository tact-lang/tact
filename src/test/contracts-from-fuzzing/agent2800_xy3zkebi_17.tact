contract Test {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int32;
    d: Int as int64;

    init() {
        self.a = 200;
        self.b = 30000;
        self.c = -100000;
        self.d = 10000000000;
    }
}