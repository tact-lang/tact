struct OptionalSlice {
    s: Slice?;
}

contract OptionalSliceContract {
    os: OptionalSlice;

    init() {
        self.os = OptionalSlice{s: null};
    }
}