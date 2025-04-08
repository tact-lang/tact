struct OptionalSlice {
    foo: Slice?;
}

contract OptSliceContract {
    val: OptionalSlice;

    init() {
        self.val = OptionalSlice{ foo: null };
    }
}