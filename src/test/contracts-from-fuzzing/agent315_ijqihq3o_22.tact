contract OptionalSlices {
    a: Slice?;
    b: Slice?;
    c: Slice?;

    init() {
        self.a = null;
        self.b = emptyCell().asSlice();
        self.c = null;
    }
}