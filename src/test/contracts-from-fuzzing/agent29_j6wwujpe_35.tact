struct SliceStruct {
    s1: Slice;
    s2: Slice;
}

contract MultipleSlices {
    data: SliceStruct;

    init() {
        self.data = SliceStruct{
            s1: "abc".asSlice(),
            s2: "def".asSlice()
        };
    }
}