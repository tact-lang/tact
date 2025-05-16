contract MixedTypes {
    intField: Int;
    boolField: Bool;
    cellField: Cell;
    strField: String;
    sliceField: Slice;
    addressField: Address;
    init() {
        self.intField = 1;
        self.boolField = true;
        self.cellField = emptyCell();
        self.strField = "abc";
        self.sliceField = emptyCell().asSlice();
        self.addressField = myAddress();
    }
}