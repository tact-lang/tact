contract ManyTypes {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    builderField: Builder;
    sliceField: Slice;
    strField: String;

    init() {
        self.intField = 0;
        self.boolField = false;
        self.addrField = myAddress();
        self.cellField = emptyCell();
        self.builderField = beginCell();
        self.sliceField = emptyCell().asSlice();
        self.strField = "";
    }
}