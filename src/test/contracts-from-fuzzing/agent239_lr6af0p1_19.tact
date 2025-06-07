contract BigManualFields {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as coins;
    f: Int;
    g: Bool;
    h: String;
    i: Slice;
    j: Cell;
    k: Address;
    l: Int?;
    m: Bool?;
    n: String?;
    o: Slice?;
    p: Cell?;
    q: Address?;

    init() {
        self.a=1; self.b=-2; self.c=3; self.d=-4; self.e=5; self.f=6;
        self.g=true; self.h="abc"; self.i=emptyCell().asSlice();
        self.j=emptyCell(); self.k=myAddress();
        self.l=null; self.m=null; self.n=null; self.o=null; self.p=null; self.q=null;
    }
}