contract TestContract {
    intField: Int;
    boolField: Bool;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String;

    init() {
        self.intField = 1;
        self.boolField = false;
        self.addressField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = self.cellField.asSlice();
        self.stringField = "test";
    }
}