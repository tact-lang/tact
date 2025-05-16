struct SliceWrap {
    s: Slice;
}

contract UseSliceWrap {
    foo: SliceWrap;
    init() {
        self.foo = SliceWrap{s: emptyCell().asSlice()};
    }
    receive() {}
}