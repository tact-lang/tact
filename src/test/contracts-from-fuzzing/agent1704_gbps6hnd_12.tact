contract AddressSliceCell {
    addr: Address;
    sliceF: Slice;
    cellF: Cell;

    init() {
        self.addr = myAddress();
        self.sliceF = emptyCell().asSlice();
        self.cellF = emptyCell();
    }
}