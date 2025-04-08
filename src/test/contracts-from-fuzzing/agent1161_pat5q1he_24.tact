struct HasSlice {
    data: Slice;
}

contract SliceField {
    payload: HasSlice;

    init() {
        self.payload = HasSlice{ data: emptyCell().asSlice() };
    }
}