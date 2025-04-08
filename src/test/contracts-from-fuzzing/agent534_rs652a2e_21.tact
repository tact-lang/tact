contract MultiVar {
    intValue: Int = 5;
    boolValue: Bool = false;
    addrValue: Address;
    cellValue: Cell;
    sliceValue: Slice;
    strValue: String = "abc";
    optInt: Int? = null;
    optBool: Bool? = null;
    optSlice: Slice? = null;

    init() {
        self.addrValue = myAddress();
        self.cellValue = emptyCell();
        self.sliceValue = emptyCell().asSlice();
    }
}