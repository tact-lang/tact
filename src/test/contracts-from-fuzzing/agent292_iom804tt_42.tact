struct NestedSlices {
    s1: Slice;
    s2: Slice;
    s3: Slice;
}

contract NestedSliceFields {
    val: NestedSlices;

    init() {
        self.val = NestedSlices{
            s1: emptyCell().asSlice(),
            s2: emptyCell().asSlice(),
            s3: emptyCell().asSlice()
        };
    }
}