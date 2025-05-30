contract WideContract {
    a: Int as uint8;
    b: Int as int64;
    c: Bool;
    d: Bool;
    e: Int as coins;
    f: Int as uint16;
    g: Int;
    h: Int as uint256;
    i: Bool;
    j: Int as uint4;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = false;
        self.e = 1000;
        self.f = 300;
        self.g = -1234567;
        self.h = 123456789;
        self.i = true;
        self.j = 7;
    }
}