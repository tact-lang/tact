struct SliceStruct {
    codePart: Slice;
    payload: Slice;
    flag: Bool;
}

contract SliceStorageTest {
    s: SliceStruct;

    init() {
        self.s = SliceStruct{
            codePart: "hello".asSlice(),
            payload: "world".asSlice(),
            flag: false,
        };
    }
}
