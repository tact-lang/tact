contract ExplicitSer {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;

    init() {
        self.a = 5;
        self.b = 200;
        self.c = -1000;
        self.d = 40000;
    }
}