struct OptionalSlices {
    maybeSlice: Slice?;
    maybeString: String?;
    maybeAddress: Address?;
    maybeCell: Cell?;
}

contract OptionalSlicesTest {
    s: OptionalSlices;

    init() {
        self.s = OptionalSlices{
            maybeSlice: null,
            maybeString: null,
            maybeAddress: null,
            maybeCell: null
        };
    }
}
