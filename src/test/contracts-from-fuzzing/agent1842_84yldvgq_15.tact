contract CellVsSlice {
    cellField: Cell;
    sliceOpt: Slice?;

    init() {
        self.cellField = emptyCell();
        self.sliceOpt = null;
    }
}