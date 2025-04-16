contract ManyPrimitiveFields {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String;

    init() {
        self.intField = 10;
        self.boolField = true;
        self.addrField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.stringField = "test";
    }
}