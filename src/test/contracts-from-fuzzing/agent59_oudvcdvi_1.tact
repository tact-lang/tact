contract ManyFields {
    i1: Int;
    i2: Int;
    b1: Bool;
    a1: Address;
    c1: Cell;
    s1: String;
    sl1: Slice;
    bl1: Builder;

    init() {
        self.i1 = 1;
        self.i2 = 2;
        self.b1 = true;
        self.a1 = myAddress();
        self.c1 = emptyCell();
        self.s1 = "test";
        self.sl1 = emptyCell().asSlice();
        self.bl1 = beginCell();
    }
}