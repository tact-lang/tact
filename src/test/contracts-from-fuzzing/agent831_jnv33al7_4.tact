contract LongFields {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: Bool;
    f: String;
    g: String;
    h: Int?;
    i: Int?;
    j: Bool?;
    k: Bool?;
    l: Address;
    m: Address;
    n: String;
    o: String;
    p: Int;
    q: Int;
    r: Int;
    s: Int;
    t: Int;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = true;
        self.e = false;
        self.f = "f";
        self.g = "g";
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = myAddress();
        self.m = myAddress();
        self.n = "n";
        self.o = "o";
        self.p = 16;
        self.q = 17;
        self.r = 18;
        self.s = 19;
        self.t = 20;
    }
}