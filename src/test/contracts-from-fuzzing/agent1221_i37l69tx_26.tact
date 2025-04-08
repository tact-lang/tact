struct WithSlice {
    data: Slice;
}

contract SliceHolder {
    s: WithSlice;

    init() {
        self.s = WithSlice{ data: emptyCell().asSlice() };
    }
}