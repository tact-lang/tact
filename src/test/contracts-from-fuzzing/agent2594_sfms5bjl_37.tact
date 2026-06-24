contract CellsAndSlices {
    a: Cell;
    b: Slice;
    c: Cell?;
    d: Slice?;

    init() {
        self.a = emptyCell();
        self.b = emptyCell().asSlice();
        self.c = null;
        self.d = null;
    }
}