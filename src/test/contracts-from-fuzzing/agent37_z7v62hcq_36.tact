contract Test {
    c1: Cell?;
    c2: Cell?;
    s1: Slice?;
    s2: Slice?;
    init() {
        self.c1 = null;
        self.c2 = emptyCell();
        self.s1 = null;
        self.s2 = emptyCell().asSlice();
    }
}