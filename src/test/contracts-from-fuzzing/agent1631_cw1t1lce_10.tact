contract HugeManyTypedFields {
    i1: Int;
    i2: Int;
    s1: String;
    s2: String;
    b1: Bool;
    b2: Bool;
    c1: Cell;
    c2: Cell;
    sl1: Slice;
    sl2: Slice;
    addr1: Address;
    addr2: Address;

    init() {
        self.i1 = 1;
        self.i2 = 2;
        self.s1 = "a";
        self.s2 = "b";
        self.b1 = true;
        self.b2 = false;
        self.c1 = emptyCell();
        self.c2 = emptyCell();
        self.sl1 = emptyCell().asSlice();
        self.sl2 = emptyCell().asSlice();
        self.addr1 = myAddress();
        self.addr2 = myAddress();
    }
}