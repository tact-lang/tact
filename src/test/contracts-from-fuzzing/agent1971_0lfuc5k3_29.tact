contract OptionalSlicesAndCells {
    s: Slice?;
    c: Cell?;

    init() {
        self.s = null;
        self.c = null;
    }
}
