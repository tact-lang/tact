contract CellStringSlice {
    cellVal: Cell;
    stringVal: String;
    sliceVal: Slice;

    init() {
        self.cellVal = emptyCell();
        self.stringVal = "abc";
        self.sliceVal = emptyCell().asSlice();
    }
}