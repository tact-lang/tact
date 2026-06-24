struct HasSlice {
    piece: Slice;
}

contract SliceInStruct {
    s: HasSlice;
    init() {
        self.s = HasSlice{ piece: emptyCell().asSlice() };
    }
}