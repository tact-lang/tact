contract OptionalSliceTest {
    optSlice: Slice?;

    init() {
        self.optSlice = emptyCell().asSlice();
    }
}
