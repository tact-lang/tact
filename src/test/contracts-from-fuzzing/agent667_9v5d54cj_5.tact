contract ManyTypes {
    intField: Int;
    boolField: Bool;
    cellField: Cell;
    sliceField: Slice;
    addressField: Address;
    stringField: String;
    optionalInt: Int?;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.addressField = myAddress();
        self.stringField = "test";
        self.optionalInt = null;
    }
}
