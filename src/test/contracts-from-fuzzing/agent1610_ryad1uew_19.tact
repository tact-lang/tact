struct SliceFields {
    s1: Slice;
    s2: Slice;
    s3: Slice;
}

contract TestSlices {
    data: SliceFields;

    init() {
        let empty = emptyCell().asSlice();
        self.data = SliceFields{
            s1: empty,
            s2: empty,
            s3: empty
        };
    }
}