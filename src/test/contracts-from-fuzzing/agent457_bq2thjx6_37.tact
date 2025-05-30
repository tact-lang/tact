struct HasSlice {
    sl: Slice;
}

contract SliceField {
    d: HasSlice;
    init() {
        self.d = HasSlice{ sl: emptyCell().asSlice() };
    }
}