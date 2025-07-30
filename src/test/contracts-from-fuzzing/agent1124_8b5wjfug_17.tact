contract UsingAllTypes {
    intField: Int;
    boolField: Bool;
    strField: String;
    cellField: Cell;
    sliceField: Slice;
    addrField: Address;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optCell: Cell?;
    optSlice: Slice?;
    optAddr: Address?;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.strField = "hi";
        self.cellField = emptyCell();
        self.sliceField = self.cellField.asSlice();
        self.addrField = myAddress();

        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
        self.optCell = null;
        self.optSlice = null;
        self.optAddr = null;
    }
}