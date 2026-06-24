contract MixedTypesContract {
    intField: Int;
    boolField: Bool;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    
    init() {
        self.intField = 10;
        self.boolField = true;
        self.addressField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.stringField = "test";
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
    }
}