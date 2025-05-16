contract Sequence {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Builder;
    g: Slice;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Address?;
    l: Cell?;
    m: Builder?;
    n: Slice?;
    
    init() {
        self.a=0; self.b=true; self.c=""; self.d=myAddress(); self.e=emptyCell(); self.f=beginCell(); self.g=emptyCell().asSlice();
        self.h=null; self.i=null; self.j=null; self.k=null; self.l=null; self.m=null; self.n=null;
    }
}
