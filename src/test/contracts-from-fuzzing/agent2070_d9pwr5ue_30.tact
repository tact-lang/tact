struct OptionalSlice {
    data: Slice?;
}

contract HasOptionalSlice {
    s: OptionalSlice;

    init() {
        self.s = OptionalSlice{
            data: null
        };
    }
}