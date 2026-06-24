struct SliceStruct {
    sl: Slice;
}

contract SliceField {
    val: SliceStruct;
    init() {
        self.val = SliceStruct{ sl: emptyCell().asSlice() };
    }
}