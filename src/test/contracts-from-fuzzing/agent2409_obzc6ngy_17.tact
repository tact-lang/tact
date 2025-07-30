contract AllBaseTypesPersist {
    intField: Int;
    boolField: Bool;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String;

    init() {
        self.intField = 42;
        self.boolField = true;
        self.addressField = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.stringField = "hello";
    }
}