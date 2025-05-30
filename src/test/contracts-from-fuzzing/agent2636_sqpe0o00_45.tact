struct OptionalSlice {
    s: Slice?;
}
contract OptionalSliceTest {
    data: OptionalSlice;

    init() {
        self.data = OptionalSlice{ s: emptyCell().asSlice() };
    }
}