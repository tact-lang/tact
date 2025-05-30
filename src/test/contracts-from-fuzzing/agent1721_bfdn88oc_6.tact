contract MaximalFieldTypes {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;
    stringField: String;
    optIntField: Int?;
    optAddr: Address?;
    optString: String?;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.addrField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.builderField = beginCell();
        self.stringField = "test";
        self.optIntField = null;
        self.optAddr = null;
        self.optString = null;
    }
}
