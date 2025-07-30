struct WithSlice {
    s: Slice;
}

contract SliceHolder {
    data: WithSlice;

    init() {
        self.data = WithSlice{
            s: emptyCell().asSlice(),
        };
    }
}