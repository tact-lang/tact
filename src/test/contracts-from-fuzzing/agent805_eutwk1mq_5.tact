contract TestContract {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int16;
    e: Int as uint32;
    f: Int as int32;
    g: Int as uint51;
    h: Int as int64;
    i: Int as uint256;
    j: Int as int257;

    init() {
        self.a = 1;
        self.b = -2;
        self.c = 3;
        self.d = -4;
        self.e = 5;
        self.f = -6;
        self.g = 7;
        self.h = -8;
        self.i = 9;
        self.j = -10;
    }
}