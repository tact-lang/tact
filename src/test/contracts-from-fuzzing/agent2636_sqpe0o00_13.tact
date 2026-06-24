struct SliceStruct {
    s1: Slice;
    s2: Slice;
}

contract SliceFields {
    val: SliceStruct;

    init() {
        let c = emptyCell().asSlice();
        self.val = SliceStruct{ s1: c, s2: c };
    }
}