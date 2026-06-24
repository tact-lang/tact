contract LargeFlatVars {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Cell?;
    j: Address?;
    k: Int;
    l: Bool;
    m: String;
    n: Cell;
    o: Address;
    p: Int?;
    q: Bool?;
    r: String?;
    s: Cell?;
    t: Address?;
    init() {
        self.a = 1;
        self.b = true;
        self.c = "hello";
        self.d = emptyCell();
        self.e = myAddress();
        self.f = null;
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = 2;
        self.l = false;
        self.m = "world";
        self.n = emptyCell();
        self.o = myAddress();
        self.p = null;
        self.q = null;
        self.r = null;
        self.s = null;
        self.t = null;
    }
}
