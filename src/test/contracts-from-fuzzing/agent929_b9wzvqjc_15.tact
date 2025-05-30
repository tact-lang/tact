struct SliceHolder {
    s: Slice;
}

contract SlicePersistent {
    holder: SliceHolder;
    init() {
        self.holder = SliceHolder{ s: emptyCell().asSlice() };
    }
}