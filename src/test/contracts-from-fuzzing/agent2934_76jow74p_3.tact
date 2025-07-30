contract ManyTypes {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    strField: String;
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.addrField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.strField = "hi";
        self.optInt = null;
        self.optBool = null;
    }
}