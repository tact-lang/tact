contract BytesFields {
    s1: Slice;
    s2: Cell;

    init() {
        self.s1 = emptyCell().asSlice();
        self.s2 = emptyCell();
    }
}
