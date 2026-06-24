struct NestedSlice {
    s: Slice;
    opt: Slice?;
}

contract SlicesInStruct {
    val: NestedSlice;
    init() {
        let c = emptyCell();
        self.val = NestedSlice{ s: c.asSlice(), opt: null };
    }
}