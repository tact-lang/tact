struct WithSlice {
    foo: Slice;
}

contract SliceInside {
    s: WithSlice;
    init() {
        self.s = WithSlice{ foo: emptyCell().asSlice() };
    }
}