contract ManyPrimitives {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String;

    init() {
        self.intField = 1;
        self.boolField = false;
        self.addrField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.stringField = "test";
    }
}