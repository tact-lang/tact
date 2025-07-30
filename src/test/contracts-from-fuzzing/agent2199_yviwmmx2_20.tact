contract OptionalStringAndSlice {
    a: String?;
    b: Slice?;
    init() {
        self.a = null;
        self.b = emptyCell().asSlice();
    }
}
