struct WithSlice {
    x: Slice;
}

contract SlicePersist {
    data: WithSlice;
    init() {
        self.data = WithSlice{ x: emptyCell().asSlice() };
    }
}