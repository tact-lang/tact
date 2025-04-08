struct NestedSlices {
    s1: Slice;
    s2: Slice;
}

contract SliceStruct {
    val: NestedSlices;
    init() {
        self.val = NestedSlices{s1: emptyCell().asSlice(), s2: emptyCell().asSlice()};
    }
}