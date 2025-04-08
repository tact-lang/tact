contract MixedFields {
    intField: Int;
    boolField: Bool;
    strField: String;
    cellField: Cell;
    builderField: Builder;
    sliceField: Slice;
    addrField: Address;

    init() {
        self.intField = 42;
        self.boolField = false;
        self.strField = "hi";
        self.cellField = emptyCell();
        self.builderField = beginCell();
        self.sliceField = emptyCell().asSlice();
        self.addrField = myAddress();
    }
}