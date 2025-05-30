struct HasSlice {
    s: Slice;
    b: Bool;
}

contract SliceStorage {
    data: HasSlice;

    init() {
        self.data = HasSlice{
            s: emptyCell().asSlice(),
            b: true,
        };
    }
}
