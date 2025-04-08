contract TestContract {
    intField: Int;
    boolField: Bool;
    strField: String;
    addressField: Address;
    sliceField: Slice;
    cellField: Cell;
    builderField: Builder;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.strField = "test";
        self.addressField = myAddress();
        self.sliceField = emptyCell().asSlice();
        self.cellField = emptyCell();
        self.builderField = beginCell();
    }
}
