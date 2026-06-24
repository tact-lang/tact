struct SliceStruct {
    s1: Slice;
    s2: Slice;
}

contract SliceFields {
    f: SliceStruct;

    init() {
        self.f = SliceStruct{
            s1: emptyCell().asSlice(),
            s2: emptyCell().asSlice()
        };
    }
}
