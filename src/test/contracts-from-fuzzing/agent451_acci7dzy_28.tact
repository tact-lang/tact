struct WithSlices {
    s1: Slice;
    s2: Slice;
    s3: Slice;
}

contract SliceStructTest {
    data: WithSlices;

    init() {
        let sl = emptyCell().asSlice();
        self.data = WithSlices{ s1: sl, s2: sl, s3: sl };
    }
}