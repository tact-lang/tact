contract FuzzMixedMany {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Address;
    f: Slice;
    g: String;
    h: Cell;
    i: Address?;
    j: Slice?;
    k: String?;
    l: Cell?;
    m: Int;
    n: Bool;
    o: Int?;
    p: Bool?;
    q: Address;
    r: Slice;
    s: String;
    t: Cell;
    u: Address?;
    v: Slice?;
    w: String?;
    x: Cell?;

    init() {
        self.a=1; self.b=true; self.c=1; self.d=false;
        self.e=sender(); self.f=emptyCell().asSlice();
        self.g="G"; self.h=emptyCell(); self.i=sender(); self.j=emptyCell().asSlice();
        self.k="K"; self.l=emptyCell(); self.m=2; self.n=false; self.o=3; self.p=true;
        self.q=sender(); self.r=emptyCell().asSlice(); self.s="S"; self.t=emptyCell();
        self.u=sender(); self.v=emptyCell().asSlice(); self.w="W"; self.x=emptyCell();
    }
}