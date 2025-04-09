contract MultiSlices {
    s1: Slice;
    s2: Slice?;
    s3: Slice;
    s4: Slice?;

    init() {
        let c = emptyCell();
        self.s1 = c.asSlice();
        self.s2 = null;
        self.s3 = c.asSlice();
        self.s4 = null;
    }
}
