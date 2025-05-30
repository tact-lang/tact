struct WithSlice {
    s: Slice;
}

contract SliceTest {
    val: WithSlice;

    init() {
        self.val = WithSlice{ s: emptyCell().asSlice() };
    }
}