contract SliceStore {
    s: Slice;

    init() {
        self.s = emptyCell().asSlice();
    }
}