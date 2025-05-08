struct WithSlice {
    s: Slice;
}

contract SliceContract {
    a: WithSlice;

    init() {
        self.a = WithSlice{ s: emptyCell().asSlice() };
    }
}