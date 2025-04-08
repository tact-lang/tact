contract TestContract {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int16;
    d: Int as uint8;
    e: Int as int257;
    f: Int as uint256;
    g: Int as int1;
    h: Int as uint1;
    i: Int as int128;
    j: Int as uint64;
    k: Int as int32;
    l: Int as uint16;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
        self.f = 6;
        self.g = 1;
        self.h = 1;
        self.i = 7;
        self.j = 8;
        self.k = 9;
        self.l = 10;
    }

    receive() {
        self.a = self.a;
    }
}
