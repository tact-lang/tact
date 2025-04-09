struct OptionalSlice {
    s: Slice?;
}

contract TestContract {
    os: OptionalSlice;

    init() {
        self.os = OptionalSlice{ s: null };
    }
}