struct SliceStruct {
    s: Slice;
}

contract SliceField {
    val: SliceStruct;

    init() {
        self.val = SliceStruct{ s: emptyCell().asSlice() };
    }
}
