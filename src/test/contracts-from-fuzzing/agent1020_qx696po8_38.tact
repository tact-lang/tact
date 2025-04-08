struct SliceStruct {
    sliceVal: Slice;
    flag: Bool;
}

contract SliceTest {
    s: SliceStruct;

    init() {
        self.s = SliceStruct{
            sliceVal: emptyCell().asSlice(),
            flag: false
        };
    }
}