contract DirectSliceField {
    s: Slice;

    init() {
        self.s = emptyCell().asSlice();
    }
}
