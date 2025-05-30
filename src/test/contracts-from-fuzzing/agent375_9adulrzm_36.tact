struct OptionalSlices {
    s1: Slice?;
    s2: Slice?;
}

contract TestContract {
    data: OptionalSlices;

    init() {
        self.data = OptionalSlices{
            s1: emptyCell().asSlice(),
            s2: null
        };
    }
}
