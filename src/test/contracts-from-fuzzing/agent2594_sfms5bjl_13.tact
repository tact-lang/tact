contract OptionalSlicesCells {
    s1: Slice?;
    s2: Slice?;
    c1: Cell?;
    c2: Cell?;

    init() {
        self.s1 = null;
        self.s2 = null;
        self.c1 = null;
        self.c2 = null;
    }
}