contract BigVars {
    i1: Int;
    i2: Int?;
    b1: Bool;
    b2: Bool?;
    s1: String;
    s2: String?;
    a1: Address;
    a2: Address?;
    c1: Cell;
    c2: Cell?;
    sl1: Slice;
    sl2: Slice?;
    bu1: Builder;
    bu2: Builder?;

    init() {
        self.i1 = 1;
        self.i2 = null;
        self.b1 = true;
        self.b2 = null;
        self.s1 = "s1";
        self.s2 = null;
        self.a1 = myAddress();
        self.a2 = null;
        self.c1 = emptyCell();
        self.c2 = null;
        self.sl1 = emptyCell().asSlice();
        self.sl2 = null;
        self.bu1 = beginCell();
        self.bu2 = null;
    }
}
