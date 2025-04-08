contract LargeDeep {
    a: Int;
    b: Address;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell?;
    k: Slice?;
    l: Builder?;
    m: Address?;
    init() {
        self.a=1; self.b=myAddress(); self.c="hi"; self.d=emptyCell();
        self.e=emptyCell().asSlice(); self.f=beginCell(); self.g=null;
        self.h=null; self.i=null; self.j=null; self.k=null; self.l=null;
        self.m=null;
    }
}