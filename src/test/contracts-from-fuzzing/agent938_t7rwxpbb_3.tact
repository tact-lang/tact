contract MultiPrimitiveFields {
    intField: Int = 1;
    boolField: Bool = true;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    strField: String = "hello";

    init() {
        self.intField = 123;
        self.boolField = false;
        self.addrField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.strField = "world";
    }
}