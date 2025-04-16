contract OptionalSlices {
    a: Slice?;
    b: Slice?;

    init() {
        self.a = null;
        self.b = emptyCell().asSlice();
    }
}