contract OptionalSlices {
    s1: Slice?;
    s2: Slice?;
    s3: Slice?;

    init() {
        self.s1 = null;
        self.s2 = emptyCell().asSlice();
        self.s3 = null;
    }
}
