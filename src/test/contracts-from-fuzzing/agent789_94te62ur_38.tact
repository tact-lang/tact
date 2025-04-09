contract OptionalSliceCell {
    s1: Slice?;
    c1: Cell?;

    init() {
        self.s1 = null;
        self.c1 = null;
    }
}
