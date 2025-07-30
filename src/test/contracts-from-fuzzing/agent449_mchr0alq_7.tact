contract ManyOptionalPrimitives {
    i1: Int?;
    i2: Int?;
    b1: Bool?;
    b2: Bool?;
    a1: Address?;
    a2: Address?;
    c1: Cell?;
    c2: Cell?;
    s1: Slice?;
    s2: Slice?;
    str1: String?;
    str2: String?;

    init() {
        self.i1 = null;
        self.i2 = 0;
        self.b1 = true;
        self.b2 = null;
        self.a1 = null;
        self.a2 = myAddress();
        self.c1 = emptyCell();
        self.c2 = null;
        self.s1 = null;
        self.s2 = emptyCell().asSlice();
        self.str1 = "abc";
        self.str2 = null;
    }
}
