contract NumerousPrimitives {
    intField: Int;
    boolField: Bool;
    sliceField: Slice;
    cellField: Cell;
    addressField: Address;
    stringField: String;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.sliceField = emptyCell().asSlice();
        self.cellField = emptyCell();
        self.addressField = myAddress();
        self.stringField = "Hi";
    }
}