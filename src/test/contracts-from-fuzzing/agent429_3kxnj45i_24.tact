struct WithSlice {
    s: Slice;
}

contract SliceStructPersist {
    f: WithSlice;
    init() {
        self.f = WithSlice{ s: emptyCell().asSlice() };
    }
}
