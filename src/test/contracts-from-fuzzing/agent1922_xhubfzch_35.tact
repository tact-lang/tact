struct HasSlice {
    content: Slice;
}

contract SliceInStorage {
    s: HasSlice;

    init() {
        self.s = HasSlice{
            content: emptyCell().asSlice()
        };
    }
}