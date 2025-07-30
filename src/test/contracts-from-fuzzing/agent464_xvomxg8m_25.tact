struct OptionalSliceBuilder {
    s: Slice?;
    b: Builder?;
}

contract OptionalSlices {
    store: OptionalSliceBuilder;

    init() {
        self.store = OptionalSliceBuilder{ s: null, b: null };
    }
}
