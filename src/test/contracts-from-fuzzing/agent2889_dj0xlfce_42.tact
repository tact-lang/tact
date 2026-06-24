contract OptionalSliceCell {
    sliceField: Slice?;
    cellField: Cell?;

    init() {
        self.sliceField = emptyCell().asSlice();
        self.cellField = emptyCell();
    }
}