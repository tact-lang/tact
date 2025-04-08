contract PrimitiveMix {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    strField: String;
    cellField: Cell;
    sliceField: Slice;

    init() {
        self.intField = -1;
        self.boolField = true;
        self.addrField = myAddress();
        self.strField = "hello";
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
    }
}