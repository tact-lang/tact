contract MultipleFields {
    intField: Int;
    boolField: Bool;
    strField: String;
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;
    addrField: Address;
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.intField = 1;
        self.boolField = false;
        self.strField = "test";
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.builderField = beginCell();
        self.addrField = myAddress();
        self.optInt = null;
        self.optBool = true;
    }
}
