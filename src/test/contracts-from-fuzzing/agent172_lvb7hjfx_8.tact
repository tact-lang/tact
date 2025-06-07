contract Test {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int8;
    d: Int as int64;
    e: Int as coins;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = -1;
        self.d = 1000000;
        self.e = 5;
    }
}