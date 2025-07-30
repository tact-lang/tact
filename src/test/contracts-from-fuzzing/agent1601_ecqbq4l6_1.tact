contract Test1 {
    intField: Int;
    boolField: Bool;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String;
    builderField: Builder;

    init() {
        self.intField = 0;
        self.boolField = false;
        self.addressField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.stringField = "hello";
        self.builderField = beginCell();
    }
}