struct HasSlice {
    data: Slice;
}

contract SliceStore {
    payload: HasSlice;

    init() {
        self.payload = HasSlice{
            data: emptyCell().asSlice()
        };
    }
}
