contract TestContract {
    intField: Int;
    boolField: Bool;
    stringField: String;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
    
    init() {
        self.intField = -123456789;
        self.boolField = true;
        self.stringField = "example";
        self.addressField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
    }
}