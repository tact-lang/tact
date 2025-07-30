contract MultiTypesFixed {
    intField: Int = 5;
    boolField: Bool = true;
    addrField: Address; // to assign init-time only
    stringField: String = "hello";
    cellField: Cell;  // assign in init()
    sliceField: Slice; // assign in init

    init() {
        self.addrField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
    }
}