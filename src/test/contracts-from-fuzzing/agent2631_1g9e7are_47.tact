contract OptionalSliceCell {
    a: Slice?;
    b: Cell?;

    init() {
        self.a = null;
        self.b = null;
    }
}