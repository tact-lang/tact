struct InnerSlice {
    data: Slice;
}

contract SliceStructTest {
    s: InnerSlice;

    init() {
        self.s = InnerSlice{ data: emptyCell().asSlice() };
    }
}