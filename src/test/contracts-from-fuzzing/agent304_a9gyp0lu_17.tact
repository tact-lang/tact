struct SliceStruct {
    s1: Slice;
    s2: Slice?;
}

contract SliceTest {
    store: SliceStruct;
    init() {
        self.store = SliceStruct{
            s1: emptyCell().asSlice(),
            s2: null
        };
    }
}
