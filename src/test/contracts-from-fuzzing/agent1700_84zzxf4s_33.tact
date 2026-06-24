contract OptionalSliceCell {
    s: Slice?;
    c: Cell?;

    init() {
        self.s = null;
        self.c = emptyCell();
    }
}
