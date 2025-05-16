contract ManyPrimitives {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    sliceField: Slice;
    cellField: Cell;
    builderField: Builder;
    strField: String;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.addrField = myAddress();
        self.sliceField = emptyCell().asSlice();
        self.cellField = emptyCell();
        self.builderField = beginCell();
        self.strField = "hi";
    }
}