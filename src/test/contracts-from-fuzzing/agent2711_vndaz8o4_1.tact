contract TestContract {
    intField: Int;
    boolField: Bool;
    addressField: Address;
    cellField: Cell;
    builderField: Builder;
    sliceField: Slice;
    stringField: String;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.addressField = myAddress();
        self.cellField = emptyCell();
        self.builderField = beginCell();
        self.sliceField = emptyCell().asSlice();
        self.stringField = "hello";
    }
}