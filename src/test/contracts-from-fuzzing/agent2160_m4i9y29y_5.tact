contract TestManyPrimitives {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;
    stringField: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.intField = 10;
        self.boolField = false;
        self.addrField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.builderField = beginCell();
        self.stringField = "test";
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
    }
}