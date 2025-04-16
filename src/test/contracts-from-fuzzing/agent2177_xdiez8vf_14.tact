contract OptionalSliceCell {
    optSlice: Slice?;
    optCell: Cell?;

    init() {
        self.optSlice = null;
        self.optCell = emptyCell();
    }
}