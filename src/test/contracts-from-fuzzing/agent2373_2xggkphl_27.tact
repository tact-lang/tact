struct HasSlice {
    s: Slice;
}

contract SliceStructContract {
    data: HasSlice;

    init() {
        self.data = HasSlice{ s: emptyCell().asSlice() };
    }
}