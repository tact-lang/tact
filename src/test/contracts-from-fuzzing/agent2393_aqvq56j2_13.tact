contract DefaultSlice {
    s: Slice;

    init() {
        self.s = emptyCell().asSlice();
    }
}