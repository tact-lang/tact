contract OptionalSliceCell {
    s: Slice? = null;
    c: Cell? = null;

    init() {
        self.s = null;
        self.c = null;
    }
}