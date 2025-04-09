contract Test {
    s1: Slice;
    s2: Slice?;

    init() {
        self.s1 = emptyCell().asSlice();
        self.s2 = null;
    }
}