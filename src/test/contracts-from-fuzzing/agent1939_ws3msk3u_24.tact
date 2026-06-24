struct SliceHolder {
    s1: Slice;
    s2: Slice;
}

contract SliceContract {
    data: SliceHolder;
    init() {
        self.data = SliceHolder{ s1: emptyCell().asSlice(), s2: emptyCell().asSlice() };
    }
}