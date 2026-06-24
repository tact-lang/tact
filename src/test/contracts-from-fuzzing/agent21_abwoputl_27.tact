struct SliceHolder {
    s: Slice;
}

contract SlicePersist {
    data: SliceHolder;

    init() {
        self.data = SliceHolder{ s: emptyCell().asSlice() };
    }
}
