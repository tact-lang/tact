struct SliceFields {
    s1: Slice;
    s2: Slice?;
    s3: Slice;
}

contract SliceStorage {
    stuff: SliceFields;

    init() {
        self.stuff = SliceFields{
            s1: emptyCell().asSlice(),
            s2: null,
            s3: emptyCell().asSlice(),
        };
    }
}