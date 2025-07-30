contract Test1 {
    intField: Int = 10;
    boolField: Bool = true;
    stringField: String = "hello";
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;

    init() {
        self.addressField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.builderField = beginCell();
    }
}