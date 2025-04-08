contract JustSlicesCells {
    a: Slice;
    b: Cell;
    c: Slice?;
    d: Cell?;

    init() {
        self.a = emptyCell().asSlice();
        self.b = emptyCell();
        self.c = null;
        self.d = null;
    }
}
