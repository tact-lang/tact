contract LongPrimitiveList {
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

    init() {
        self.a = 1; self.b = true; self.c = "hello";
        self.d = emptyCell(); self.e = emptyCell().asSlice(); self.f = beginCell(); self.g = myAddress();
        self.h = null; self.i = null; self.j = null;
        self.k = null; self.l = null; self.m = null; self.n = null;
        self.o=2; self.p=false; self.q="hi"; self.r=emptyCell(); self.s=emptyCell().asSlice(); self.t=beginCell(); self.u=myAddress();
    }
}