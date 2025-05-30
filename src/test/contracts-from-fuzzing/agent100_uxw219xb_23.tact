struct WithSlice {
    s: Slice;
    b: Bool;
}

contract SliceStruct {
    data: WithSlice;

    init() {
        self.data = WithSlice{
            s: emptyCell().asSlice(),
            b: true
        };
    }
}