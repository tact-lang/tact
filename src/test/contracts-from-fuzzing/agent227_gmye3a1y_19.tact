struct SliceStruct {
    sliceVal: Slice;
}

contract TestContract {
    s: SliceStruct;

    init() {
        self.s = SliceStruct{ sliceVal: emptyCell().asSlice() };
    }
}