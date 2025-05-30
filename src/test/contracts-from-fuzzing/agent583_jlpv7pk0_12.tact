contract TwentyMixFields {
    a: Int;
    b: Bool?;
    c: Int?;
    d: Bool;
    e: String?;
    f: String;
    g: Address?;
    h: Address;
    i: Int;
    j: Bool?;
    k: Int?;
    l: Bool;
    m: String?;
    n: String;
    o: Address?;
    p: Address;
    q: Int;
    r: Bool?;
    s: Int?;
    t: Bool;

    init() {
        self.a = 1; self.b = null; self.c = 2; self.d = true; self.e = null;
        self.f = "f"; self.g = null; self.h = myAddress(); self.i = 9; self.j = false;
        self.k = null; self.l = false; self.m = "hi"; self.n = "n"; self.o = null;
        self.p = myAddress(); self.q = 17; self.r = true; self.s = 29; self.t = false;
    }
}