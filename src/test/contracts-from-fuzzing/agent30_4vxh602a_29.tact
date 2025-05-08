contract AddressSlices {
    addr: Address;
    slice: Slice;
    c: Cell;

    init() {
        self.addr = myAddress();
        self.slice = emptyCell().asSlice();
        self.c = emptyCell();
    }
}