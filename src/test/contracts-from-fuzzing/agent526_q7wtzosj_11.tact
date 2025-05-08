contract AllPrimitiveFields {
    intField: Int;
    boolField: Bool;
    strField: String;
    cellField: Cell;
    sliceField: Slice;
    addrField: Address;

    init() {
        self.intField = 100;
        self.boolField = true;
        self.strField = "hello";
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.addrField = myAddress();
    }
}
