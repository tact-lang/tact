struct WithSlices {
    s1: Slice;
    s2: Slice?;
}

contract SliceFields {
    data: WithSlices;

    init() {
        let empty = emptyCell().asSlice();
        self.data = WithSlices{ s1: empty, s2: null };
    }
}