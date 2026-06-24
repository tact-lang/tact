contract OptionalSliceDefaults {
    s1: Slice? = null;
    s2: Slice?;
    s3: Slice? = null;

    init() {
        self.s1 = emptyCell().asSlice();
        self.s2 = null;
        self.s3 = emptyCell().asSlice();
    }
}