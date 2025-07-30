struct WithSlice {
    s: Slice;
}

contract SliceStructTest {
    w: WithSlice;
    
    init() {
        self.w = WithSlice{ s: emptyCell().asSlice() };
    }
}