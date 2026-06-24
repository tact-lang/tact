contract ManyTypes {
    intField: Int = 0;
    boolField: Bool = false;
    cellField: Cell; // no default
    sliceField: Slice; // no default
    builderField: Builder; // no default
    addrField: Address; // no default
    strField: String = "test";
    optInt: Int? = null;
    optBool: Bool? = null;
    optString: String? = null;
    optCell: Cell? = null;

    init() {
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.builderField = beginCell();
        self.addrField = myAddress();
    }
}