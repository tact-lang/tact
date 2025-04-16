contract ManyFieldTypes {
    intField: Int;
    boolField: Bool;
    stringField: String;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    
    init() {
        self.intField = 1;
        self.boolField = false;
        self.stringField = "hello";
        self.addrField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
    }
}