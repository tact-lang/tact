contract OptionalSliceFields {
    s1: Slice?;
    s2: Slice?;
    init() {
        self.s1 = null;
        self.s2 = null;
    }
}