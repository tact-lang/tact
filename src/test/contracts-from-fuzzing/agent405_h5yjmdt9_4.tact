contract BigStorage {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
    k: String;
    l: String?;
    m: Int;
    n: Int?;
    o: Bool;
    p: Bool?;
    q: Address;
    r: Address?;
    s: Cell;
    t: Cell?;

    init() {
        self.a = 0;
        self.b = null;
        self.c = false;
        self.d = null;
        self.e = myAddress();
        self.f = null;
        self.g = emptyCell();
        self.h = null;
        self.i = emptyCell().asSlice();
        self.j = null;
        self.k = "";
        self.l = null;
        self.m = 1;
        self.n = null;
        self.o = true;
        self.p = null;
        self.q = myAddress();
        self.r = null;
        self.s = emptyCell();
        self.t = null;
    }
}