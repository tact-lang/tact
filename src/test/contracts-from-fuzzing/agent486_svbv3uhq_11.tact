contract BigContract {
    i1: Int = 1;
    i2: Int = 2;
    s1: String = "hello";
    s2: String = "world";
    b1: Bool = false;
    b2: Bool = true;
    addr1: Address;
    addr2: Address;
    cell1: Cell;
    cell2: Cell;
    slice1: Slice;
    slice2: Slice;

    init() {
        self.addr1 = myAddress();
        self.addr2 = myAddress();
        self.cell1 = emptyCell();
        self.cell2 = emptyCell();
        self.slice1 = emptyCell().asSlice();
        self.slice2 = emptyCell().asSlice();
    }
}