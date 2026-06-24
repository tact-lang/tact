contract TestContract {
    intField: Int = 1;
    boolField: Bool = true;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String = "test string";

    init() {
        self.addressField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
    }

    receive() {
        let _ = self.intField;
        let _ = self.boolField;
        let _ = self.addressField;
        let _ = self.cellField;
        let _ = self.sliceField;
        let _ = self.stringField;
    }
}