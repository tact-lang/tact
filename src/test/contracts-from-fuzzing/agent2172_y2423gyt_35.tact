struct OptionalSlice {
    s: Slice?;
}

contract OptSliceField {
    sliceWrap: OptionalSlice;

    init() {
        self.sliceWrap = OptionalSlice{ s: null };
    }
}