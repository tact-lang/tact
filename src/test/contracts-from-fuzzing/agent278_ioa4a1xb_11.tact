contract LargeFlat {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
    e: String?;
    f: Int;
    g: Bool;
    h: Cell;
    i: Slice;
    j: String;
    k: Int?;
    l: Bool?;
    m: String?;
    n: Slice?;
    o: Cell?;
    p: Int;
    q: Bool;
    r: Cell;
    s: Slice;
    t: String;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = 1;
        self.g = true;
        self.h = emptyCell();
        self.i = emptyCell().asSlice();
        self.j = "text";
        self.k = null;
        self.l = null;
        self.m = null;
        self.n = null;
        self.o = null;
        self.p = 2;
        self.q = false;
        self.r = emptyCell();
        self.s = emptyCell().asSlice();
        self.t = "more";
    }
}