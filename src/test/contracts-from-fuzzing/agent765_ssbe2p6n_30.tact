contract NestedSlicesCells {
    c1: Cell;
    s1: Slice;
    c2: Cell;
    s2: Slice;
    init() {
        self.c1 = emptyCell();
        self.s1 = emptyCell().asSlice();
        self.c2 = emptyCell();
        self.s2 = emptyCell().asSlice();
    }
}