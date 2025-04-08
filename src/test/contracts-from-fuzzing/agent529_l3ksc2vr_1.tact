contract ManyTypes {
    intField: Int;
    boolField: Bool;
    optIntField: Int?;
    strField: String;
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;
    addrField: Address;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.optIntField = null;
        self.strField = "hello";
        self.cellField = emptyCell();
        self.sliceField = self.cellField.asSlice();
        self.builderField = beginCell();
        self.addrField = myAddress();
    }
}