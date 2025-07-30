contract LotsOfPrimitive {
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;
    bool1: Bool;
    bool2: Bool;
    bool3: Bool;
    bool4: Bool;
    addr1: Address;
    addr2: Address;
    addr3: Address;
    addr4: Address;
    cell1: Cell;
    cell2: Cell;
    slice1: Slice;
    slice2: Slice;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.int3 = 3;
        self.int4 = 4;
        self.bool1 = true;
        self.bool2 = false;
        self.bool3 = true;
        self.bool4 = false;
        self.addr1 = myAddress();
        self.addr2 = myAddress();
        self.addr3 = myAddress();
        self.addr4 = myAddress();
        self.cell1 = emptyCell();
        self.cell2 = emptyCell();
        self.slice1 = emptyCell().asSlice();
        self.slice2 = emptyCell().asSlice();
    }
}