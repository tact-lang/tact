struct MultipleSlices {
    s1: Slice;
    s2: Slice;
    s3: Slice;
}

contract MultiSliceContract {
    data: MultipleSlices;

    init() {
        self.data = MultipleSlices{
            s1: emptyCell().asSlice(),
            s2: emptyCell().asSlice(),
            s3: emptyCell().asSlice(),
        };
    }
}
