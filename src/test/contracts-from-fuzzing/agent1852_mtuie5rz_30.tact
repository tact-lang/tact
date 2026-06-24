struct WithSlice {
    s: Slice;
}

contract SliceAsField {
    data: WithSlice;

    init() {
        self.data = WithSlice{s: emptyCell().asSlice()};
    }
}