contract MultiTypes {
    intField: Int;
    boolField: Bool;
    stringField: String;
    cellField: Cell;
    sliceField: Slice;
    addressField: Address;

    init() {
        self.intField = 123;
        self.boolField = true;
        self.stringField = "hi";
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.addressField = myAddress();
    }
}