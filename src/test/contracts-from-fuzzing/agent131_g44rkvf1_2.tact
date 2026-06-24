contract ManyPrimitiveFields {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    builderField: Builder;
    sliceField: Slice;
    strField: String;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.addrField = myAddress();
        self.cellField = emptyCell();
        self.builderField = beginCell();
        self.sliceField = emptyCell().asSlice();
        self.strField = "test";
    }
}
