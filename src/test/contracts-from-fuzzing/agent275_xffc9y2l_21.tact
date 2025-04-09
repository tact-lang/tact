struct HasSlice {
    data: Slice;
}

contract SliceInStruct {
    s: HasSlice;

    init() {
        self.s = HasSlice{ data: emptyCell().asSlice() };
    }
}