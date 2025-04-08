contract SliceVar {
    s: Slice;

    init() {
        self.s = emptyCell().asSlice();
    }
}