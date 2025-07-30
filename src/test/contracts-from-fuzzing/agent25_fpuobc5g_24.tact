contract Test {
    a: Int as uint4;
    b: Int as int4;
    c: Int as uint8;
    d: Int as int8;
    e: Int as uint16;

    init() {
        self.a = 2;
        self.b = -2;
        self.c = 200;
        self.d = -100;
        self.e = 5000;
    }
}