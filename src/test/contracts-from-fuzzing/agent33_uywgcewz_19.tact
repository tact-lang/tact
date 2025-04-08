struct OptionalSlices {
    sl1: Slice?;
    sl2: Slice?;
}

contract OptionalsInSlicesContract {
    s: OptionalSlices;

    init() {
        self.s = OptionalSlices{
            sl1: emptyCell().asSlice(),
            sl2: null,
        };
    }
}