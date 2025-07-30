contract Test37 {
    s: Slice;

    init() {
        self.s = emptyCell().asSlice();
    }
}