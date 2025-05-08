contract MaximalPrimitives {
    intField: Int;
    boolField: Bool;
    stringField: String;
    addrOpt: Address?;
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;

    init() {
        self.intField = 42;
        self.boolField = false;
        self.stringField = "max";
        self.addrOpt = null;
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.builderField = beginCell();
    }
}