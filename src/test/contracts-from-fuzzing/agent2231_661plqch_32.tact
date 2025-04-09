struct NestedSliceFields {
    s1: Slice;
    inner: InnerStruct;
}

struct InnerStruct {
    s2: Slice;
    s3: Slice?;
}

contract SlicesDeepContract {
    data: NestedSliceFields;

    init() {
        self.data = NestedSliceFields{
            s1: emptyCell().asSlice(),
            inner: InnerStruct{
                s2: emptyCell().asSlice(),
                s3: null
            }
        };
    }
}