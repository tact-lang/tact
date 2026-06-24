struct OptionalSlice {
    s: Slice?;
}

contract OptSliceTest {
    inner: OptionalSlice;
    init() {
        self.inner = OptionalSlice{s: null};
    }
}