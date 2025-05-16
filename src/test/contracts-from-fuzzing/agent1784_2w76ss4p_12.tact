struct SliceStruct {
    aa: Slice;
}

contract SlicePersistent {
    s: SliceStruct;

    init() {
        self.s = SliceStruct{ aa: emptyCell().asSlice() };
    }
}