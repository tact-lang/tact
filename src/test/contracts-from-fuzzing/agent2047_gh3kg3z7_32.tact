contract CombinedTypes {
    intField: Int;
    boolField: Bool;
    stringField: String;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;

    init() {
        self.intField = 42;
        self.boolField = true;
        self.stringField = "hi";
        self.addressField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = self.cellField.asSlice();
    }
}