contract LongPrim {
    a: Int as int8;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as int32;
    e: Int as uint32;
    f: Int as int64;
    g: Int as uint64;
    h: Int as int128;
    i: Int as uint128;
    j: Int as int256;
    k: Bool;
    l: Bool;
    m: Bool;
    n: Bool;

    init() {
        self.a = -5;
        self.b = 5;
        self.c = 1500;
        self.d = -10000;
        self.e = 20000;
        self.f = -500000;
        self.g = 9000000;
        self.h = -123456789;
        self.i = 123456789;
        self.j = -1;
        self.k = true;
        self.l = false;
        self.m = true;
        self.n = false;
    }

    receive() {}
}