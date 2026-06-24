contract Test {
    a: Cell;
    b: Slice;
    c: Builder;

    init() {
        self.a = emptyCell();
        self.b = emptyCell().asSlice();
        self.c = beginCell();
    }
}
