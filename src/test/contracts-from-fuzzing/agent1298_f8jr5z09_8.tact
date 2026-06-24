contract TestContract {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optSlice: Slice?;
    optStr: String?;
    init() {
        self.intField = 2;
        self.boolField = false;
        self.addrField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.stringField = "ok";
        self.optInt = 7;
        self.optBool = true;
        self.optAddr = myAddress();
        self.optSlice = emptyCell().asSlice();
        self.optStr = "world";
    }
}