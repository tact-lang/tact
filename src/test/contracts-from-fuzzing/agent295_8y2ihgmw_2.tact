contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Cell?;
    l: Slice?;
    m: Builder?;
    n: Address?;
    o: Int;
    p: Bool;
    q: String;
    r: Cell;
    s: Slice;
    t: Builder;
    u: Address;
    v: Int;
    w: Bool;
    x: String;
    y: Cell;
    z: Slice;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "c";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = beginCell();
        self.g = myAddress();
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
        self.m = null;
        self.n = null;
        self.o = 2;
        self.p = false;
        self.q = "q";
        self.r = emptyCell();
        self.s = emptyCell().asSlice();
        self.t = beginCell();
        self.u = myAddress();
        self.v = 3;
        self.w = true;
        self.x = "x";
        self.y = emptyCell();
        self.z = emptyCell().asSlice();
    }
}