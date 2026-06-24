contract LargeFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int as uint8;
    h: Int as int32;
    i: Int as uint64;
    j: Bool;
    k: String;
    l: Bool?;
    m: Int?;
    n: String?;
    o: Int as int256;
    p: Int as uint256;
    q: Bool;
    r: String;
    s: Int?;
    t: Bool?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "test";
        self.d = 2;
        self.e = null;
        self.f = null;
        self.g = 3;
        self.h = 4;
        self.i = 5;
        self.j = false;
        self.k = "hello";
        self.l = true;
        self.m = null;
        self.n = "there";
        self.o = -42;
        self.p = 100;
        self.q = true;
        self.r = "world";
        self.s = 7;
        self.t = false;
    }
}