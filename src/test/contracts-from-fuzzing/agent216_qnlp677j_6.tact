contract OnlyOptionals {
    i1: Int?;
    i2: Int?;
    i3: Int?;
    i4: Int?;
    i5: Int?;
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
    a1: Address?;
    c1: Cell?;
    sl1: Slice?;
    s1: String?;
    s2: String?;

    init() {
        self.i1 = null;
        self.i2 = null;
        self.i3 = null;
        self.i4 = null;
        self.i5 = null;
        self.b1 = null;
        self.b2 = null;
        self.b3 = null;
        self.a1 = null;
        self.c1 = null;
        self.sl1 = null;
        self.s1 = null;
        self.s2 = null;
    }
}