contract BuilderSlice {
    b: Builder;
    s: Slice;

    init() {
        self.b = beginCell();
        self.s = emptyCell().asSlice();
    }
}