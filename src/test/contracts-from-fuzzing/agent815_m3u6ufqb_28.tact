struct SliceStruct {
    s: Slice;
    opt: Slice?;
}

contract SliceStructStore {
    data: SliceStruct;

    init() {
        self.data = SliceStruct{
            s: emptyCell().asSlice(),
            opt: null
        };
    }
}