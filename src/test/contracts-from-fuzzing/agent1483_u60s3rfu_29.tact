contract MultipleTypes {
    intField: Int = 123;
    boolField: Bool = true;
    stringField: String = "hi";
    addressField: Address? = null;
    cellField: Cell;
    sliceField: Slice;

    init() {
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
    }
}