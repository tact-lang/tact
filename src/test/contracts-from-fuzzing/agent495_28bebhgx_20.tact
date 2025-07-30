contract NestedSlicesCells {
    s: Slice;
    c: Cell;
    optS: Slice?;
    optC: Cell?;

    init() {
        self.s = emptyCell().asSlice();
        self.c = emptyCell();
        self.optS = null;
        self.optC = null;
    }
}
