contract ManyFieldsAndTypes {
    intField: Int;
    boolField: Bool;
    strField: String;
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optCell: Cell?;
    optAddr: Address?;
    addrField: Address;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.strField = "abc";
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.builderField = beginCell();
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
        self.optCell = null;
        self.optAddr = null;
        self.addrField = myAddress();
    }
}
