contract MultiFields {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    stringField: String;
    cellField: Cell;
    sliceField: Slice;
    optIntField: Int?;
    optAddrField: Address?;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.addrField = myAddress();
        self.stringField = "test";
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.optIntField = null;
        self.optAddrField = null;
    }
}
