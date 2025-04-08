contract LongFields {
    a: Int;
    b: Bool;
    c: Cell;
    d: Address;
    e: String;
    f: Int?;
    g: Bool?;
    h: Cell?;
    i: Address?;
    j: String?;
    k: Int;
    l: Bool;
    m: Cell;
    n: Address;
    o: String;
    p: Int?;
    q: Bool?;
    r: Cell?;
    s: Address?;
    t: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = emptyCell();
        self.d = myAddress();
        self.e = "test";
        self.f = null;
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = 2;
        self.l = false;
        self.m = emptyCell();
        self.n = myAddress();
        self.o = "more";
        self.p = null;
        self.q = null;
        self.r = null;
        self.s = null;
        self.t = null;
    }
}