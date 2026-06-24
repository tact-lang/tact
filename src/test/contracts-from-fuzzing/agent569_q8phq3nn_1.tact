contract TestContract {
    intField: Int;
    boolField: Bool;
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;
    stringField: String;
    addressField: Address;

    init() {
        self.intField = 1;
        self.boolField = false;
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.builderField = beginCell();
        self.stringField = "hello";
        self.addressField = myAddress();
    }
}