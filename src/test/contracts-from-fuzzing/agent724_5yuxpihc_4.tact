contract ManyFields {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool;
    e: String;
    f: String;
    g: Slice;
    h: Slice;
    i: Cell;
    j: Cell;
    k: Address;
    l: Address;
    m: Int?;
    n: Int?;
    o: String?;
    p: String?;
    q: Bool?;
    r: Bool?;
    s: Cell;
    t: Address;

    init() {
        self.a=1; self.b=2; self.c=true; self.d=false; 
        self.e="a"; self.f="b"; self.g=emptyCell().asSlice(); self.h=emptyCell().asSlice();
        self.i=emptyCell(); self.j=emptyCell(); self.k=myAddress(); self.l=myAddress();
        self.m=null; self.n=null; self.o=null; self.p=null; self.q=null; self.r=null;
        self.s=emptyCell(); self.t=myAddress();
    }
}