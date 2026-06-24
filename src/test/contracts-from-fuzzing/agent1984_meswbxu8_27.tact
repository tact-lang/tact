struct OptSlice {
    a: Slice?;
    b: Slice;
}

contract OptionalSlices {
    field: OptSlice;

    init() {
        self.field = OptSlice{
            a: null,
            b: emptyCell().asSlice(),
        };
    }
}