struct HasSlice {
    data: Slice;
}

contract SliceContainer {
    store: HasSlice;

    init() {
        self.store = HasSlice{ data: emptyCell().asSlice() };
    }
}
