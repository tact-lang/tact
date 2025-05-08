struct ManySlices {
    s1: Slice;
    s2: Slice;
    s3: Slice;
}

contract SliceTest {
    v: ManySlices;
    init() {
        self.v = ManySlices{
            s1: emptyCell().asSlice(),
            s2: emptyCell().asSlice(),
            s3: emptyCell().asSlice(),
        };
    }
}