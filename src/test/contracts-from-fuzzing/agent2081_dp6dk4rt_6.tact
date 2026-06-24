contract LargeIntFields {
    a: Int as int257;
    b: Int as int256;
    c: Int as uint256;
    d: Int as int128;
    e: Int as uint64;
    f: Int as int64;
    g: Int as uint32;
    h: Int as int16;
    i: Int as uint8;
    j: Int as int1;
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
        self.j = 0;
    }
}