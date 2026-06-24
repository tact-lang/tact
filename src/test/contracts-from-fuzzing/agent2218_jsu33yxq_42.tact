contract CellVariants {
    c1: Cell;
    c2: Cell?;
    s1: Slice;
    s2: Slice?;

    init() {
        self.c1 = emptyCell();
        self.c2 = null;
        self.s1 = emptyCell().asSlice();
        self.s2 = null;
    }
}