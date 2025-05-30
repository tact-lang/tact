contract SerialVar {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint16;
    d: Int;

    init() {
        self.a = 1;
        self.b = -100;
        self.c = 55;
        self.d = 123456789;
    }
}