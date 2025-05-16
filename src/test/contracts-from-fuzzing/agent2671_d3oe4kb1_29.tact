struct WithSlices {
    s1: Slice;
    s2: Slice?;
    s3: Slice;
}

contract SliceFields {
    value: WithSlices;

    init() {
        self.value = WithSlices{
            s1: emptyCell().asSlice(),
            s2: null,
            s3: emptyCell().asSlice()
        };
    }
}