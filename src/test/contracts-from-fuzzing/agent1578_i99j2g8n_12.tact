contract TestContract {
    a: Int as uint4; // 4-bit unsigned
    b: Int as int8; // 8-bit signed
    c: Int as uint12; // 12-bit unsigned
    d: Int as int20; // 20-bit signed

    init() {
        self.a = 7;
        self.b = -5;
        self.c = 1000;
        self.d = -100000;
    }
}