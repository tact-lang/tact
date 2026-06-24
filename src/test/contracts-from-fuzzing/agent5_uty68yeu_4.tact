contract ManyPrimitives {
    a: Int;
    b: Int as uint32;
    c: Int as int64;
    d: Int as uint8;
    e: Int as int8;
    f: Int as uint128;
    g: Int as int256;
    h: Int as uint16;
    i: Bool;
    j: Bool;
    k: Int;
    l: Int as uint4;
    m: Int as int1;
    n: Int as uint1;
    o: Int as int257;

    init() {
        self.a = 0;
        self.b = 1;
        self.c = -1;
        self.d = 255;
        self.e = -128;
        self.f = 0;
        self.g = -1;
        self.h = 65535;
        self.i = true;
        self.j = false;
        self.k = 123;
        self.l = 7;
        self.m = -1;
        self.n = 1;
        self.o = 0;
    }
}