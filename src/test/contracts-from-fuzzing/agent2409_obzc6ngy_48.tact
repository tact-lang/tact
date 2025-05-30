struct OptionalSlices {
    a: Slice?;
    b: Slice?;
    c: Slice?;
}

contract MultiOptionalSlices {
    s: OptionalSlices;

    init() {
        self.s = OptionalSlices{
            a: null,
            b: null,
            c: null
        };
    }
}