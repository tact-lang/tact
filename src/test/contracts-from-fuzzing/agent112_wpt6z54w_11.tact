contract MultiFields {
    intField: Int;
    boolField: Bool;
    stringField: String;
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;
    addressField: Address;
    optIntField: Int?;
    optBoolField: Bool?;
    optStringField: String?;

    init() {
        self.intField = 11;
        self.boolField = true;
        self.stringField = "test";
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.builderField = beginCell();
        self.addressField = myAddress();
        self.optIntField = null;
        self.optBoolField = false;
        self.optStringField = null;
    }
}