struct NestedSlices {
    s1: Slice;
    s2: Slice?;
    s3: Slice;
    s4: Slice?;
}

contract SliceContract {
    slabs: NestedSlices;

    init() {
        self.slabs = NestedSlices{
            s1: emptyCell().asSlice(),
            s2: null,
            s3: emptyCell().asSlice(),
            s4: null
        };
    }
}