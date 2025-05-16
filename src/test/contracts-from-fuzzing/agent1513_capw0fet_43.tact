struct OptionalSlice {
    sl: Slice?;
}

contract OptSliceTest {
    data: OptionalSlice;

    init() {
        self.data = OptionalSlice { sl: null };
    }
}