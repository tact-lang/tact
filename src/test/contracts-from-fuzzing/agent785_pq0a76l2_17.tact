// Large contract with many persistent fields
contract LargeFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool?;
    l: String?;
    m: Int;
    n: Bool;
    o: String;
    p: Int?;
    q: Bool?;
    r: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "c";
        self.d = 4;
        self.e = null;
        self.f = null;
        self.g = 7;
        self.h = false;
        self.i = "i";
        self.j = null;
        self.k = true;
        self.l = "l";
        self.m = 13;
        self.n = false;
        self.o = "o";
        self.p = null;
        self.q = null;
        self.r = "r";
    }
}
