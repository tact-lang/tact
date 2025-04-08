struct HasSlice {
    s: Slice;
}

contract SliceField {
    data: HasSlice;

    init() {
        self.data = HasSlice{ s: emptyCell().asSlice() };
    }
}