struct WithSlice {
    data: Slice;
}

contract SliceField {
    s: WithSlice;

    init() {
        self.s = WithSlice{data: "hello".asComment().asSlice()};
    }
}