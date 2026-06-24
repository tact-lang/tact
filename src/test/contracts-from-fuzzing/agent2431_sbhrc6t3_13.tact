contract EmptySlice {
    s: Slice;

    init() {
        self.s = emptyCell().asSlice();
    }
}