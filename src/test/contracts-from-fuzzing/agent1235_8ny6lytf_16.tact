struct WithSlice {
    s: Slice;
    flag: Bool;
}

contract SliceStruct {
    data: WithSlice;

    init() {
        self.data = WithSlice{
            s: emptyCell().asSlice(),
            flag: true
        };
    }
}