contract OptionalSliceAndCell {
    cellOpt: Cell?;
    sliceOpt: Slice?;

    init() {
        self.cellOpt = null;
        self.sliceOpt = null;
    }
}