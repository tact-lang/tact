struct HasSlice {
    data: Slice;
    extra: Int;
}

contract SliceStorage {
    state: HasSlice;

    init() {
        self.state = HasSlice{ data: emptyCell().asSlice(), extra: 1 };
    }
}