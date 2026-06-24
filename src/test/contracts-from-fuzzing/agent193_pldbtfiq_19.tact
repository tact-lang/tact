struct HasSlice {
    s: Slice;
}

contract SliceField {
    val: HasSlice;

    init() {
        self.val = HasSlice{s: emptyCell().asSlice()};
    }
}