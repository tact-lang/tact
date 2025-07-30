contract TestContract {
    intField: Int;
    boolField: Bool;
    addressField: Address;
    stringField: String;
    cellField: Cell;
    sliceField: Slice;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.addressField = myAddress();
        self.stringField = "test";
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
    }
}
