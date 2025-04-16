struct OptionalSlices {
    a: Slice?;
    b: Slice?;
    c: Slice?;
}

contract OptSliceFields {
    data: OptionalSlices;

    init() {
        self.data = OptionalSlices{a: null, b: null, c: null};
    }
}