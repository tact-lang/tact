contract ManyCellsAndSlices {
    c1: Cell;
    c2: Cell;
    c3: Cell;
    s1: Slice;
    s2: Slice;
    s3: Slice;

    init() {
        self.c1 = emptyCell();
        self.c2 = emptyCell();
        self.c3 = emptyCell();
        self.s1 = emptyCell().asSlice();
        self.s2 = emptyCell().asSlice();
        self.s3 = emptyCell().asSlice();
    }
}
