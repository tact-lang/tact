contract OptionalStringAndSlice {
    s: String?;
    sl: Slice?;

    init() {
        self.s = "hello";
        self.sl = emptyCell().asSlice();
    }
}