contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;
    m: Int;
    n: Bool;
    o: String;
    p: Cell;
    q: Slice;
    r: Address;
    s: Int?;
    t: Bool?;
    u: String?;
    v: Address?;

    init() {
        self.a = 0;
        self.b = false;
        self.c = "";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
        self.m = 0;
        self.n = false;
        self.o = "";
        self.p = emptyCell();
        self.q = emptyCell().asSlice();
        self.r = myAddress();
        self.s = null;
        self.t = null;
        self.u = null;
        self.v = null;
    }
}