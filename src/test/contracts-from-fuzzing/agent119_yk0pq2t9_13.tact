contract TestContract {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;
    f: Int as coins;
    g: Int as uint3;
    h: Int as int5;
    i: Int as uint251;
    j: Int as int255;

    init() {
        self.a = 1;
        self.b = -2;
        self.c = 3;
        self.d = -4;
        self.e = 5;
        self.f = 6;
        self.g = 7;
        self.h = -1;
        self.i = 8;
        self.j = -9;
    }
}