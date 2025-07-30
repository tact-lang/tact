struct HasSlice {
    data: Slice;
}

contract SliceStore {
    s: HasSlice;

    init() {
        self.s = HasSlice{ data: emptyCell().asSlice() };
    }
}