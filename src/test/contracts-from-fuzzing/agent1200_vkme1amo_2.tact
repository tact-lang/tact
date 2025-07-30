contract ContractWithManyFields {
    i1: Int;
    i2: Int as uint8;
    b1: Bool;
    s1: String;
    a1: Address;
    c1: Cell;
    sl1: Slice;

    init() {
        self.i1 = 1;
        self.i2 = 255;
        self.b1 = true;
        self.s1 = "hello";
        self.a1 = myAddress();
        self.c1 = emptyCell();
        self.sl1 = self.c1.asSlice();
    }
}