contract OptionalSlices {
    a: Slice?;
    b: Slice?;

    init() {
        self.a = emptyCell().asSlice();
        self.b = null;
    }
}
