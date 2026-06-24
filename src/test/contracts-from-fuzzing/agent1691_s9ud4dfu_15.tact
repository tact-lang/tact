struct SliceFields {
    s1: Slice;
    s2: Slice;
    s3: Slice;
}

contract SliceFieldsTest {
    data: SliceFields;

    init() {
        let c = emptyCell().asSlice();
        self.data = SliceFields{
            s1: c, s2: c, s3: c
        };
    }
}