contract FlatFields {
    intField: Int;
    boolField: Bool;
    stringField: String;
    optField: Bool?;
    sliceField: Slice;
    cellField: Cell;
    addrField: Address;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.stringField = "abc";
        self.optField = null;
        self.sliceField = emptyCell().asSlice();
        self.cellField = emptyCell();
        self.addrField = myAddress();
    }
}