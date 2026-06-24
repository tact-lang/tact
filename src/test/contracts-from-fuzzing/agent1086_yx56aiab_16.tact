struct HasSlice {
    value: Slice;
}

contract SliceInState {
    data: HasSlice;

    init() {
        self.data = HasSlice{
            value: emptyCell().asSlice()
        };
    }
}