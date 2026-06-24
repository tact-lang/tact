contract SliceAndCell {
    c: Cell;
    s: Slice;
    init() {
        self.c = emptyCell();
        self.s = self.c.asSlice();
    }
}