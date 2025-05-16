contract TestContract {
    intField: Int;
    boolField: Bool;
    cellField: Cell;
    sliceField: Slice;
    addressField: Address;
    stringField: String;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.addressField = myAddress();
        self.stringField = "test";
    }
}