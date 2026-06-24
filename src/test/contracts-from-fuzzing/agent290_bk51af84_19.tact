contract Test {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int32;
    d: Int as uint64;
    e: Int as int128;
    f: Int as int256;
    g: Bool;
    h: Bool;
    i: Int as coins;
    j: Int as uint4;
    k: Int as int8;
    l: Int as uint24;
    m: Int;
    n: Int as uint32;
    o: Int as int64;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = -123;
        self.d = 1000000;
        self.e = -3000000;
        self.f = -1;
        self.g = true;
        self.h = false;
        self.i = 1000;
        self.j = 10;
        self.k = -5;
        self.l = 16777215; // 2^24 -1
        self.m = 0;
        self.n = 123456;
        self.o = 7890;
    }
}