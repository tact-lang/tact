contract OptionalStringSlice {
    s: String?;
    sl: Slice?;

    init() {
        self.s = null;
        self.sl = null;
    }
}