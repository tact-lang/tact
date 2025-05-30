struct OptSlice {
    s1: Slice?;
    s2: Slice?;
    flag: Bool;
}

contract OptionalSlices {
    data: OptSlice;
    init() {
        self.data = OptSlice{
            s1: null,
            s2: null,
            flag: true,
        };
    }
}