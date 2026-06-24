struct NestedSlices {
    s1: Slice;
    s2: Slice?;
    s3: Slice;
}

contract TestContract {
    data: NestedSlices;

    init() {
        self.data = NestedSlices{
            s1: emptyCell().asSlice(),
            s2: null,
            s3: emptyCell().asSlice()
        };
    }
}