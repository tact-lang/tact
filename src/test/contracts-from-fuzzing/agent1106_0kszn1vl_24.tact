contract OptionalStringCellSlice {
    s: String?;
    c: Cell?;
    sl: Slice?;

    init() {
        self.s = null;
        self.c = null;
        self.sl = null;
    }
}