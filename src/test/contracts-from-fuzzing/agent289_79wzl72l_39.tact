contract NestedSliceTest {
    s1: Slice;
    s2: Slice;
    s3: Slice;

    init() {
        let c = emptyCell();
        self.s1 = c.asSlice();
        self.s2 = c.asSlice();
        self.s3 = c.asSlice();
    }
}