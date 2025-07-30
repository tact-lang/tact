contract NullableSliceCell {
    a: Slice?;
    b: Cell?;
    init() {
        self.a = null;
        self.b = null;
    }
}