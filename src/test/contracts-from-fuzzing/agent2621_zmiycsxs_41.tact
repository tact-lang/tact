contract Test {
    s: Slice;
    optS: Slice?;
    init() {
        self.s = emptyCell().asSlice();
        self.optS = null;
    }
}