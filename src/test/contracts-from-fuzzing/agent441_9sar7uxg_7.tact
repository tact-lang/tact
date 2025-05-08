contract TestContract {
    intField: Int;
    boolField: Bool;
    stringField: String;
    cellField: Cell;
    sliceField: Slice;
    addressField: Address;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optCell: Cell?;
    optSlice: Slice?;
    optAddress: Address?;

    init() {
        self.intField = -10;
        self.boolField = true;
        self.stringField = "abc";
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.addressField = myAddress();
        self.optInt = null;
        self.optBool = null;
        self.optString = null;
        self.optCell = null;
        self.optSlice = null;
        self.optAddress = null;
    }
}