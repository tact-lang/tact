contract OptionalCellsAndSlices {
    c: Cell?;
    s: Slice?;

    init() {
        self.c = emptyCell();
        self.s = emptyCell().asSlice();
    }
}