// test nested struct with optional slice
struct SliceOptWrap {
    s: Slice?;
}

contract TestOptSliceNested {
    val: SliceOptWrap = SliceOptWrap{s: null};

    init() {
        self.val = SliceOptWrap{s: emptyCell().asSlice()};
    }
}
