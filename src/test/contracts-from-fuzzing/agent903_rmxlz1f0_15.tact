struct SliceHolder {
    s: Slice;
}

contract SliceInPersist {
    data: SliceHolder;

    init() {
        self.data = SliceHolder{ s: emptyCell().asSlice() };
    }
}