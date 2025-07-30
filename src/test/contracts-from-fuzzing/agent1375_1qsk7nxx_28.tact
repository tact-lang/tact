contract JustCellAndSlice {
    a: Cell;
    b: Slice;

    init() {
        self.a = emptyCell();
        self.b = emptyCell().asSlice();
    }
}