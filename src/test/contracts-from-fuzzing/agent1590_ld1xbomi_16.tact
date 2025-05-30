struct SliceHolder {
    s: Slice;
}

contract SliceInStruct {
    f: SliceHolder;

    init() {
        self.f = SliceHolder{ s: emptyCell().asSlice() };
    }
}