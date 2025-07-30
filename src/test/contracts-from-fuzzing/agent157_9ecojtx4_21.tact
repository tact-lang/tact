contract CellAndSliceFields {
    c1: Cell;
    c2: Cell;
    s1: Slice;
    s2: Slice;

    init() {
        let c = emptyCell();
        self.c1 = c;
        self.c2 = c;
        self.s1 = c.asSlice();
        self.s2 = c.asSlice();
    }
}
