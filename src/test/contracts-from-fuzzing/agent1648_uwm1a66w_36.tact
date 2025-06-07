struct WithSlice {
    s: Slice;
}

contract SliceField {
    d: WithSlice;

    init() {
        let c = emptyCell();
        self.d = WithSlice{ s: c.asSlice() };
    }
}