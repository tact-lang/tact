contract BigPersistent {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;

    g: Int;
    h: Bool;
    i: String;
    j: Slice;
    k: Cell;
    l: Address;

    m: Int;
    n: Bool;
    o: String;
    p: Slice;
    q: Cell;
    r: Address;

    s: Int;
    t: Bool;
    u: String;
    v: Slice;
    w: Cell;
    x: Address;

    init() {
        self.a=1; self.b=true; self.c="a"; self.d=emptyCell().asSlice(); self.e=emptyCell(); self.f=myAddress();
        self.g=2; self.h=false; self.i="b"; self.j=emptyCell().asSlice(); self.k=emptyCell(); self.l=myAddress();
        self.m=3; self.n=true; self.o="c"; self.p=emptyCell().asSlice(); self.q=emptyCell(); self.r=myAddress();
        self.s=4; self.t=false; self.u="d"; self.v=emptyCell().asSlice(); self.w=emptyCell(); self.x=myAddress();
    }
}