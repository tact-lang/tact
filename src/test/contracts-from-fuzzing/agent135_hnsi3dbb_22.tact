contract LongFlat {
    a: Int;
    b: Bool;
    c: Cell;
    d: String;
    e: Int?;
    f: Bool?;
    g: Cell?;
    h: String?;
    i: Address;
    j: Slice;
    k: Slice?;
    l: Address?;
    m: Int;
    n: Bool;
    o: Cell;
    p: String;
    q: Int?;
    r: Bool?;
    s: Cell?;
    t: String?;
    u: Address;
    v: Slice;
    w: Slice?;
    x: Address?;
    y: Int;
    z: Bool;

    init() {
        self.a = 1; self.b = true; self.c = emptyCell(); self.d = "d";
        self.e = null; self.f = null; self.g = null; self.h = null;
        self.i = myAddress(); self.j = emptyCell().asSlice(); self.k = null;
        self.l = null; self.m = 2; self.n = false; self.o = emptyCell();
        self.p = "p"; self.q = null; self.r = null; self.s = null; self.t = null;
        self.u = myAddress(); self.v = emptyCell().asSlice(); self.w = null; self.x = null;
        self.y = 3; self.z = true;
    }
}