contract ManyPrimitiveFields {
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
    addr1: Address;
    addr2: Address;

    init() {
        self.i1 = 1;
        self.i2 = 2;
        self.b1 = true;
        self.b2 = false;
        self.s1 = "hi";
        self.s2 = "ho";
        self.c1 = emptyCell();
        self.c2 = emptyCell();
        self.sl1 = emptyCell().asSlice();
        self.sl2 = emptyCell().asSlice();
        self.addr1 = myAddress();
        self.addr2 = myAddress();
    }
}