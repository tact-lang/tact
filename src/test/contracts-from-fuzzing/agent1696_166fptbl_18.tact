contract ManyPrimitives {
    cell1: Cell;
    cell2: Cell;
    slice1: Slice;
    slice2: Slice;
    addr1: Address;
    addr2: Address;
    int1: Int = 1;
    int2: Int = 2;
    bool1: Bool = true;
    bool2: Bool = false;
    str1: String = "a";
    str2: String = "b";

    init() {
        self.addr1 = myAddress();
        self.addr2 = myAddress();
        self.cell1 = emptyCell();
        self.cell2 = emptyCell();
        self.slice1 = emptyCell().asSlice();
        self.slice2 = emptyCell().asSlice();
    }
}