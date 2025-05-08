struct WithSlices {
    s1: Slice;
    s2: Slice;
    s3: Slice;
}

contract SliceStructStorage {
    s: WithSlices;

    init() {
        let cell = emptyCell();
        self.s = WithSlices{
            s1: cell.asSlice(),
            s2: cell.asSlice(),
            s3: cell.asSlice(),
        };
    }
}