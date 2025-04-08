contract OptionalStringSliceCell {
    s: String?;
    sl: Slice?;
    c: Cell?;

    init() {
        self.s = null;
        self.sl = null;
        self.c = null;
    }
}