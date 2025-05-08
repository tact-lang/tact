contract Overlapping {
    intField: Int;
    optField: Int?;
    boolField: Bool;
    stringField: String;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;

    init() {
        self.intField = 13;
        self.optField = null;
        self.boolField = true;
        self.stringField = "string";
        self.addressField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
    }
}