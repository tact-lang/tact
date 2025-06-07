contract TestContract {
    intField: Int;
    boolField: Bool;
    sliceField: Slice;
    cellField: Cell;
    builderField: Builder;
    stringField: String;
    addressField: Address;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.sliceField = emptyCell().asSlice();
        self.cellField = emptyCell();
        self.builderField = beginCell();
        self.stringField = "test";
        self.addressField = myAddress();
    }
}
