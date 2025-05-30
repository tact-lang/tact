contract TestContract {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint4;
    d: Int as int64;
    e: Int as coins;

    init() {
        self.a = 1;
        self.b = -123;
        self.c = 7;
        self.d = 123456789;
        self.e = 999999999;
    }
}
