contract VarietyFields {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String;

    init() {
        self.intField = 42;
        self.boolField = true;
        self.addrField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = self.cellField.asSlice();
        self.stringField = "hello";
    }
}