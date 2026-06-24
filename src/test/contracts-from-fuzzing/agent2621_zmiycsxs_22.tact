struct SliceWrap {
    payload: Slice;
}

contract Test {
    wrap: SliceWrap;
    init() {
        self.wrap = SliceWrap{ payload: emptyCell().asSlice() };
    }
}