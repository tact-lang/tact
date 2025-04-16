struct OptSlices {
    s1: Slice?;
    s2: Slice?;
}

contract TestContract {
    os: OptSlices;

    init() {
        self.os = OptSlices{
            s1: null,
            s2: emptyCell().asSlice(),
        };
    }
}
