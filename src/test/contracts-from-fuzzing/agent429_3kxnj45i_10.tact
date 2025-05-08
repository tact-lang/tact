contract MaximalPrimitives {
    intField: Int;
    boolField: Bool;
    stringField: String;
    cellField: Cell;
    sliceField: Slice;
    addrField: Address;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optCell: Cell?;
    optSlice: Slice?;
    optAddr: Address?;
    init() {
        self.intField = 12;
        self.boolField = true;
        self.stringField = "str";
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.addrField = myAddress();
        self.optInt = null;
        self.optBool = false;
        self.optString = null;
        self.optCell = null;
        self.optSlice = null;
        self.optAddr = null;
    }
}
