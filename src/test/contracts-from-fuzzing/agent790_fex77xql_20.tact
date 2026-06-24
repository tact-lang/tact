struct HasSlice {
    sl: Slice;
}

contract SliceContract {
    val: HasSlice;

    init() {
        self.val = HasSlice{sl: emptyCell().asSlice()};
    }
}