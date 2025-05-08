struct WithSlice {
    s: Slice;
}

contract SliceInStruct {
    val: WithSlice;

    init() {
        self.val = WithSlice{ s: emptyCell().asSlice() };
    }
}