contract Test {
    addressField: Address;
    sliceField: Slice;
    cellField: Cell;
    stringField: String;
    optAddress: Address?;
    optSlice: Slice?;
    optCell: Cell?;
    optString: String?;

    init() {
        self.addressField = myAddress();
        self.sliceField = emptyCell().asSlice();
        self.cellField = emptyCell();
        self.stringField = "hi";
        self.optAddress = null;
        self.optSlice = null;
        self.optCell = null;
        self.optString = null;
    }
}