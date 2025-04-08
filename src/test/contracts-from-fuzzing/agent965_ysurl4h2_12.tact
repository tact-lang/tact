struct SliceStruct {
    sl: Slice;
}

contract SliceField {
    s: SliceStruct;

    init() {
        self.s = SliceStruct{ sl: emptyCell().asSlice() };
    }
}