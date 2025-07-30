contract SliceBuilderCombo {
    s: Slice;
    b: Builder;

    init() {
        self.s = emptyCell().asSlice();
        self.b = beginCell();
    }
}
