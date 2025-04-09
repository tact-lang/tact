contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int;
    i: Bool;
    j: String;
    k: Address;
    l: Cell;
    m: Slice;
    n: Builder;
    o: Int;
    p: Bool;
    q: String;
    r: Address;
    s: Cell;
    t: Slice;
    u: Builder;

    init() {
        self.a = 1; self.b=true; self.c="a"; self.d = myAddress(); self.e=emptyCell(); self.f=emptyCell().asSlice(); self.g=beginCell();
        self.h = 2; self.i=false; self.j="b"; self.k=myAddress(); self.l=emptyCell(); self.m=emptyCell().asSlice(); self.n=beginCell();
        self.o = 3; self.p=true; self.q="c"; self.r=myAddress(); self.s=emptyCell(); self.t=emptyCell().asSlice(); self.u=beginCell();
    }
}