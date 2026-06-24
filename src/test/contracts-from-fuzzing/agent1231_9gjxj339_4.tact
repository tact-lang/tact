contract ManyPrimitives {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    stringField: String;
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.addrField = myAddress();
        self.stringField = "test";
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.builderField = beginCell();
    }
}