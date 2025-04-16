contract MixedTypes {
    intField: Int;
    boolField: Bool;
    stringField: String;
    sliceField: Slice;
    cellField: Cell;
    addressField: Address;

    init() {
        self.intField = 42;
        self.boolField = true;
        self.stringField = "hi";
        self.sliceField = emptyCell().asSlice();
        self.cellField = emptyCell();
        self.addressField = myAddress();
    }
}