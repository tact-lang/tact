struct SliceStruct {
    s1: Slice;
    s2: Slice;
    s3: Slice;
}

contract SliceFields {
    data: SliceStruct;

    init() {
        let empty = emptyCell().asSlice();
        self.data = SliceStruct{
            s1: empty,
            s2: empty,
            s3: empty,
        };
    }
}