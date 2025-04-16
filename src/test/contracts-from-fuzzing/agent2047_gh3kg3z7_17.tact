contract OptionalMixed {
    intField: Int?;
    boolField: Bool?;
    strField: String?;
    cellField: Cell?;
    sliceField: Slice?;

    init() {
        self.intField = null;
        self.boolField = null;
        self.strField = null;
        self.cellField = null;
        self.sliceField = null;
    }
}