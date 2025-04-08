contract SlicePersistent {
    s: Slice;

    init() {
        self.s = emptyCell().asSlice();
    }
}
