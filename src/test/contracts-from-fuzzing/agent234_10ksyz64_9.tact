contract AllPrimitiveFields {
    intField: Int;
    boolField: Bool;
    addressField: Address;
    cellField: Cell;
    builderField: Builder;
    sliceField: Slice;
    stringField: String;

    init() {
        self.intField = 42;
        self.boolField = false;
        self.addressField = myAddress();
        self.cellField = emptyCell();
        self.builderField = beginCell();
        self.sliceField = emptyCell().asSlice();
        self.stringField = "Hello";
    }
}