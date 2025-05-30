contract TestLiteralOnly {
    intField: Int = 42;
    boolField: Bool = true;
    stringField: String = "hello";
    cellField: Cell;
    sliceField: Slice;
    init() {
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
    }
    receive() {}
}