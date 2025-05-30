contract ManyPrimitiveFields {
    intField: Int;
    boolField: Bool;
    strField: String;
    sliceField: Slice;
    cellField: Cell;
    addrField: Address;

    init() {
        self.intField = 99;
        self.boolField = true;
        self.strField = "hello";
        self.sliceField = emptyCell().asSlice();
        self.cellField = emptyCell();
        self.addrField = myAddress();
    }
}