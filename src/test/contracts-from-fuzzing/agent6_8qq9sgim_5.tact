contract ManyTypes {
    intField: Int = 1;
    boolField: Bool = true;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String = "test";

    init() {
        self.intField = 42;
        self.boolField = false;
        self.addrField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.stringField = "done";
    }
}