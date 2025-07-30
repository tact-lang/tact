contract MixedTypes {
    intField: Int;
    boolField: Bool;
    stringField: String;
    cellField: Cell;
    sliceField: Slice;
    addressField: Address;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.stringField = "hi";
        self.cellField = emptyCell();
        self.sliceField = self.cellField.asSlice();
        self.addressField = myAddress();
    }
}