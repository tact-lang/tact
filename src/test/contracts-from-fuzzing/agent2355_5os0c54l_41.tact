struct HasSlice {
    s: Slice;
}

contract SliceField {
    f: HasSlice;

    init() {
        self.f = HasSlice{ s: emptyCell().asSlice() };
    }
}