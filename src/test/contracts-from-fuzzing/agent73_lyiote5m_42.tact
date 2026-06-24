contract Test {
    cellField: Cell;
    sliceField: Slice;
    addrField: Address;

    init() {
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.addrField = myAddress();
    }
}