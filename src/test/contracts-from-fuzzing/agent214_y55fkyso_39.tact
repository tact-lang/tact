contract BigFieldsDifferentTypes {
    a: Int;
    b: String;
    c: Bool;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: String?;
    i: Bool?;
    j: Address?;
    k: Cell?;
    l: Slice?;

    init() {
        self.a=1; self.b="hi"; self.c=true; self.d=myAddress();
        self.e=emptyCell(); self.f=self.e.asSlice(); self.g=2;
        self.h=null; self.i=null; self.j=null; self.k=null; self.l=null;
    }
}
