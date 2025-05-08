contract InitCellTest {
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;

    init() {
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.builderVal = beginCell();
    }
}