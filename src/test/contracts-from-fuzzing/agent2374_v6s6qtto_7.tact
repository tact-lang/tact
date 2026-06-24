contract MixedTypes {
    intField: Int;
    boolField: Bool;
    stringField: String;
    cellField: Cell;
    sliceField: Slice;
    addrField: Address;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.intField = 1;
        self.boolField = false;
        self.stringField = "hi";
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.addrField = myAddress();
        self.optInt = null;
        self.optBool = null;
        self.optStr = "hello";
    }
}