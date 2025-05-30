contract ManyPrimitives {
    intField: Int = 42;
    boolField: Bool = true;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String = "Hello";

    init() {
        self.addressField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
    }
}