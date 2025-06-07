contract NestedOptionalsPrimitives {
    i1: Int?;
    i2: Int?;
    b1: Bool?;
    b2: Bool?;
    s1: String?;
    s2: String?;
    c1: Cell?;
    c2: Cell?;
    sl1: Slice?;
    sl2: Slice?;
    a1: Address?;
    a2: Address?;

    init() {
        self.i1 = null;
        self.i2 = 2;
        self.b1 = true;
        self.b2 = null;
        self.s1 = null;
        self.s2 = "string";
        self.c1 = emptyCell();
        self.c2 = null;
        self.sl1 = emptyCell().asSlice();
        self.sl2 = null;
        self.a1 = myAddress();
        self.a2 = null;
    }
}