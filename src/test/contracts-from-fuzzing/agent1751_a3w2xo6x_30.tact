struct OptionalSlices {
    s1: Slice?;
    s2: Slice?;
}

contract OptionalSlicesContract {
    data: OptionalSlices;

    init() {
        self.data = OptionalSlices{
            s1: null,
            s2: null
        };
    }
}
