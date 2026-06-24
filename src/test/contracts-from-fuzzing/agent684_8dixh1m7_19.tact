struct SliceHolder {
    s: Slice;
}

contract SliceContract {
    data: SliceHolder;
    init() {
        self.data = SliceHolder { s: emptyCell().asSlice() };
    }
}