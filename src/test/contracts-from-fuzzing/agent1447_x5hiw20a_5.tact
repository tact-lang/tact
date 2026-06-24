contract SingleSlice {
    s: Slice;

    init() {
        self.s = emptyCell().asSlice();
    }
}