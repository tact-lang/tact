contract LargeNesting {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
    k: Address;
    l: Address?;

    init() {
        self.a=1; self.b="s"; self.c=true; self.d=null; self.e=null; self.f=null;
        self.g=emptyCell(); self.h=null; self.i=emptyCell().asSlice(); self.j=null;
        self.k=myAddress(); self.l=null;
    }
}