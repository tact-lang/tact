contract Test {
    s: Slice;
    c: Cell;
    init() {
        self.s = emptyCell().asSlice();
        self.c = emptyCell();
    }
}