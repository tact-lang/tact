contract DifferentPrimitives {
    int1: Int;
    int2: Int;
    bool1: Bool;
    bool2: Bool;
    addr: Address;
    str: String;
    cell: Cell;
    slice: Slice;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.bool1 = true;
        self.bool2 = false;
        self.addr = myAddress();
        self.str = "abc";
        self.cell = emptyCell();
        self.slice = self.cell.asSlice();
    }
}
