contract CellsSlices {
    c1: Cell;
    c2: Cell;
    s1: Slice;
    s2: Slice;

    init() {
        self.c1 = emptyCell();
        self.c2 = emptyCell();
        self.s1 = self.c1.asSlice();
        self.s2 = self.c2.asSlice();
    }
}