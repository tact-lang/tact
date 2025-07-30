contract ManyPrimitives {
    i1: Int;
    i2: Int;
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;
    c1: Cell;
    c2: Cell;
    sl1: Slice;
    sl2: Slice;
    bu1: Builder;
    bu2: Builder;
    a1: Address;
    a2: Address;

    init() {
        self.i1=1; self.i2=2; self.b1=true; self.b2=false;
        self.s1="x"; self.s2="y";
        self.c1=emptyCell(); self.c2=emptyCell();
        self.sl1=emptyCell().asSlice(); self.sl2=emptyCell().asSlice();
        self.bu1=beginCell(); self.bu2=beginCell();
        self.a1=myAddress(); self.a2=myAddress();
    }
}
