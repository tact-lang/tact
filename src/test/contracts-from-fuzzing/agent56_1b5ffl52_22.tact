contract ScalarsTiny {
    a: Int as uint1;
    b: Int as uint8;
    c: Int as int4;

    init() {
        self.a = 1;
        self.b = 255;
        self.c = -8;
    }
}