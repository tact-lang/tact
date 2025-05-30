contract MultiSliceFields {
    s1: Slice;
    s2: Slice?;
    s3: Slice?;

    init() {
        self.s1 = emptyCell().asSlice();
        self.s2 = null;
        self.s3 = emptyCell().asSlice();
    }
}