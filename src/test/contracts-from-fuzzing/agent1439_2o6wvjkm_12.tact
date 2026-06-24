struct SliceField {
    s: Slice;
}

contract SliceStorage {
    f: SliceField;
    init() {
        self.f = SliceField{ s: emptyCell().asSlice() };
    }
}