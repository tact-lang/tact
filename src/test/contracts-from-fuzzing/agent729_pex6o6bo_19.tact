contract SliceAndBuilder {
    s: Slice;
    b: Builder;

    init() {
        self.s = emptyCell().asSlice();
        self.b = beginCell();
    }

    receive() {}
}