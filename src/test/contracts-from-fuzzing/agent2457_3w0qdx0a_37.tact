contract OptionalSlicesCells {
    a: Slice?;
    b: Cell?;
    c: Slice;
    d: Cell;

    init() {
        self.a = null;
        self.b = null;
        self.c = emptyCell().asSlice();
        self.d = emptyCell();
    }
}