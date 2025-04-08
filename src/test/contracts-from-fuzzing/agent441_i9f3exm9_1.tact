contract TestContract {
    intField: Int;
    boolField: Bool;
    addressField: Address;
    stringField: String;
    cellField: Cell;
    sliceField: Slice;
    
    init() {
        self.intField = 1;
        self.boolField = true;
        self.addressField = myAddress();
        self.stringField = "Hello";
        self.cellField = emptyCell();
        self.sliceField = self.cellField.asSlice();
    }
}
