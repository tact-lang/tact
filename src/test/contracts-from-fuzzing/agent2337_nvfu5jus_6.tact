contract LargeStorage {
    int1: Int;
    int2: Int;
    bool1: Bool;
    bool2: Bool;
    addr1: Address;
    addr2: Address;
    slice1: Slice;
    slice2: Slice;
    cell1: Cell;
    cell2: Cell;
    str1: String;
    str2: String;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.bool1 = true;
        self.bool2 = false;
        self.addr1 = myAddress();
        self.addr2 = myAddress();
        self.slice1 = emptyCell().asSlice();
        self.slice2 = emptyCell().asSlice();
        self.cell1 = emptyCell();
        self.cell2 = emptyCell();
        self.str1 = "foo";
        self.str2 = "bar";
    }
}