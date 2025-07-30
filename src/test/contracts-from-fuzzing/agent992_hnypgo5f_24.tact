contract TestContract {
    a: Int as uint4;
    b: Int as int16;
    c: Int as uint8;
    d: Int as int64;
    e: Int as uint32;

    init() {
        self.a = 7;
        self.b = -10;
        self.c = 200;
        self.d = 50000;
        self.e = 123456;
    }
}
