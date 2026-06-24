contract LongPrimitiveList {
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
    t: String?;

    init() {
        self.a=1; self.b=true; self.c="c"; self.d=myAddress(); self.e=emptyCell();
        self.f=emptyCell().asSlice(); self.g=null; self.h=null; self.i=null; self.j=null; 
        self.k=null; self.l=null; self.m=2; self.n=false; self.o="o"; self.p=myAddress();
        self.q=emptyCell(); self.r=emptyCell().asSlice(); self.s=null; self.t=null;
    }
}
