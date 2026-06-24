contract LongChainFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Cell;
    h: Slice;
    i: Cell?;
    j: Slice?;
    k: Address;
    l: Address?;
    m: Bool;
    n: Bool?;
    o: Int;
    p: Int?;
    q: String;
    r: String?;
    s: Cell;
    t: Cell?;

    init() {
        self.a=1; self.b=true; self.c="a"; self.d=null; self.e=null; self.f=null;
        self.g=emptyCell(); self.h=emptyCell().asSlice(); self.i=null; self.j=null;
        self.k=myAddress(); self.l=null; self.m=false; self.n=null;
        self.o=2; self.p=null; self.q="b"; self.r=null; self.s=emptyCell(); self.t=null;
    }
}
