contract TestContract {
    intField: Int;
    boolField: Bool;
    strField: String;
    cellField: Cell;
    sliceField: Slice;
    addressField: Address;
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalAddress: Address?;
    
    init() {
        self.intField = 1;
        self.boolField = true;
        self.strField = "test";
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.addressField = myAddress();
        self.optionalInt = null;
        self.optionalBool = null;
        self.optionalAddress = null;
    }
}