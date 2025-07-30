struct SliceTestStruct {
    a: Slice;
    b: String;
}

contract SliceStorage {
    s: SliceTestStruct;

    init() {
        self.s = SliceTestStruct{
            a: emptyCell().asSlice(),
            b: "hi",
        };
    }
}