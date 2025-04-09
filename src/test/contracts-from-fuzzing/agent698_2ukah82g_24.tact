contract TestContract {
    a: Int as int4;
    b: Int as uint4;
    c: Int as int8;
    d: Int as uint8;

    init() {
        self.a = 7;
        self.b = 15;
        self.c = -8;
        self.d = 255;
    }
}