contract DirectCellSliceStorage {
    c: Cell;
    s: Slice;
    b: Builder;

    init() {
        self.c = emptyCell();
        self.s = self.c.asSlice();
        self.b = beginCell();
    }
}
