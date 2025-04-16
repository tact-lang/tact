contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;
    m: Int;
    n: Bool;
    o: String;
    p: Address;
    q: Cell;
    r: Slice;
    s: Int?;
    t: Bool?;
    u: String?;
    v: Address?;
    w: Cell?;
    x: Slice?;
    y: Int;
    z: Bool;
    za: String;
    zb: Address;
    zc: Cell;
    zd: Slice;

    init() {
        self.a = 0; self.b = false; self.c = ""; self.d = myAddress(); self.e = emptyCell(); self.f = emptyCell().asSlice();
        self.g = null; self.h = null; self.i = null; self.j = null; self.k = null; self.l = null;
        self.m = 0; self.n = false; self.o = ""; self.p = myAddress(); self.q = emptyCell(); self.r = emptyCell().asSlice();
        self.s = null; self.t = null; self.u = null; self.v = null; self.w = null; self.x = null;
        self.y = 0; self.z = false; self.za = ""; self.zb = myAddress(); self.zc = emptyCell(); self.zd = emptyCell().asSlice();
    }
}