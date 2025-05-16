contract LargeFields {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Address;
    f: String;
    g: Int?;
    h: Bool?;
    i: Cell?;
    j: Slice?;
    k: Address?;
    l: String?;
    m: Int;
    n: Bool;
    o: Cell;
    p: Slice;
    q: Address;
    r: String;
    s: Int?;
    t: Bool?;
    u: Cell?;
    v: Slice?;
    w: Address?;
    x: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = emptyCell();
        self.d = emptyCell().asSlice();
        self.e = myAddress();
        self.f = "f";
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
        self.m = 2;
        self.n = false;
        self.o = emptyCell();
        self.p = emptyCell().asSlice();
        self.q = myAddress();
        self.r = "r";
        self.s = null;
        self.t = null;
        self.u = null;
        self.v = null;
        self.w = null;
        self.x = null;
    }
}