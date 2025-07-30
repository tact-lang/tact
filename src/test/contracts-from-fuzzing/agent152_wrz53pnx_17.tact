contract AllTypesVars {
    intField: Int;
    boolField: Bool;
    addrField: Address?;
    sliceField: Slice;
    cellField: Cell;
    strField: String;
    optIntField: Int?;
    optBoolField: Bool?;
    optStrField: String?;

    init() {
        self.intField = 7;
        self.boolField = true;
        self.addrField = null;
        self.sliceField = emptyCell().asSlice();
        self.cellField = emptyCell();
        self.strField = "s";
        self.optIntField = null;
        self.optBoolField = null;
        self.optStrField = null;
    }
}
