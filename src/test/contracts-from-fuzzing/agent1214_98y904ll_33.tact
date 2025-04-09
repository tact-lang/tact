contract Test33 {
    s: Slice;
    c: Cell;
    init() {
        self.c = emptyCell();
        self.s = self.c.asSlice();
    }
}