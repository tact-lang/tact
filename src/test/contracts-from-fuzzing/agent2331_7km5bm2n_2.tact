contract Test {
    d: Cell;
    e: Slice;
    f: Builder;
    init() {
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = beginCell();
    }
}