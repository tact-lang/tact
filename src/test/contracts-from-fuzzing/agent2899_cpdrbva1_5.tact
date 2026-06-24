contract ManyBasicFields {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    b1: Bool;
    b2: Bool;
    a1: Address;
    a2: Address;
    s1: String;
    s2: String;
    c1: Cell;
    c2: Cell;
    sl1: Slice;
    sl2: Slice;

    init() {
        self.i1 = 1; self.i2 = 2; self.i3 = 3; self.i4 = 4;
        self.b1 = true; self.b2 = false;
        self.a1 = myAddress(); self.a2 = myAddress();
        self.s1 = "x"; self.s2 = "y";
        self.c1 = emptyCell(); self.c2 = emptyCell();
        self.sl1 = self.c1.asSlice(); self.sl2 = self.c2.asSlice();
    }
}
