struct SliceStruct {
    s1: Slice;
    s2: Slice;
}

contract StorageSlicesTest {
    data: SliceStruct;

    init() {
        self.data = SliceStruct{
            s1: emptyCell().asSlice(),
            s2: emptyCell().asSlice(),
        };
    }
}