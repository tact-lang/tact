struct WithOptionalSlice {
    s: Slice?;
}

contract OptSliceTest {
    data: WithOptionalSlice;

    init() {
        self.data = WithOptionalSlice{ s: emptyCell().asSlice() };
    }
}
