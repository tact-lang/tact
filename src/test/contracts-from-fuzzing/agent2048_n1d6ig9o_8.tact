contract OnlyPrimitives {
    intField: Int;
    boolField: Bool;
    stringField: String;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;

    init() {
        self.intField = 42;
        self.boolField = true;
        self.stringField = "hi";
        self.addrField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.builderField = beginCell();
    }
}
