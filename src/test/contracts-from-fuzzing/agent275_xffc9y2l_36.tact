struct OptionalSlice {
    s: Slice?;
}

contract OptionalSliceField {
    v: OptionalSlice;

    init() {
        self.v = OptionalSlice{ s: null };
    }
}