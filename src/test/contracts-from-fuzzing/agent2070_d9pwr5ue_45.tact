struct OptionalSliceNonNested {
    data: Slice?;
}

contract OptionalSliceField {
    s: OptionalSliceNonNested;

    init() {
        self.s = OptionalSliceNonNested{
            data: null
        };
    }
}