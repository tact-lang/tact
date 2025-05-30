contract TestContract {
    intField: Int = 1;
    boolField: Bool = true;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String;

    init() {
        self.addressField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.stringField = "hello";
    }
}