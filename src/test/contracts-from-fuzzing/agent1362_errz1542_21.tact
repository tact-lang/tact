contract MultiPrimitive {
    intField: Int = 42;
    boolField: Bool = false;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;

    init() {
        self.addrField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = self.cellField.asSlice();
    }
}