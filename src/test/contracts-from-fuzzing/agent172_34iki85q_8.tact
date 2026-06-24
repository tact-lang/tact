contract ManyFields {
    a: Int;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
    e: Int as int64;
    f: Int as uint128;
    g: Int as uint256;
    h: Int as int257;
    i: Bool;
    j: Bool;
    k: Bool;
    l: Bool;
    m: String;
    n: String;
    o: String;
    p: String;
    q: Int?;
    r: Int?;
    s: Bool?;
    t: String?;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
        self.f = 6;
        self.g = 7;
        self.h = 8;
        self.i = true;
        self.j = false;
        self.k = true;
        self.l = false;
        self.m = "m";
        self.n = "n";
        self.o = "o";
        self.p = "p";
        self.q = null;
        self.r = null;
        self.s = null;
        self.t = null;
    }
}