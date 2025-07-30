contract FlatPrimitives {
    int1: Int;
    int2: Int;
    bool1: Bool;
    bool2: Bool;
    str: String;
    addr: Address;
    slice: Slice;
    builder: Builder;
    cell: Cell;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.bool1 = true;
        self.bool2 = false;
        self.str = "hi";
        self.addr = myAddress();
        self.slice = emptyCell().asSlice();
        self.builder = beginCell();
        self.cell = emptyCell();
    }
}