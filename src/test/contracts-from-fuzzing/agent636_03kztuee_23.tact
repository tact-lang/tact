struct SliceFields {
    s1: Slice;
    s2: Slice?;
}

contract SliceFieldsContract {
    slices: SliceFields;

    init() {
        self.slices = SliceFields{ s1: emptyCell().asSlice(), s2: null };
    }
}
