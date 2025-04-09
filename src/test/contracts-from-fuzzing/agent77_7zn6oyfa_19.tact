contract WideMix {
    a1: Int;
    a2: Int?;
    b1: Bool;
    b2: Bool?;
    c1: String;
    c2: String?;
    d1: Address;
    d2: Address?;
    e1: Cell;
    e2: Cell?;
    f1: Slice;
    f2: Slice?;

    init() {
        self.a1=1; self.a2=null;
        self.b1=true; self.b2=null;
        self.c1="x"; self.c2=null;
        self.d1=myAddress(); self.d2=null;
        self.e1=emptyCell(); self.e2=null;
        self.f1=emptyCell().asSlice(); self.f2=null;
    }
}