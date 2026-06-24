struct OptionalSlice {
    a: Slice?;
    b: Slice?;
    c: Slice?;
}

contract ContractOptionalSlice {
    data: OptionalSlice;

    init() {
        self.data = OptionalSlice{ a: null, b: null, c: null };
    }
}