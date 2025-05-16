struct OptionalSliceAddress {
    s: Slice?;
    a: Address?;
}

contract TestContract {
    osa: OptionalSliceAddress;

    init() {
        self.osa = OptionalSliceAddress{
            s: null,
            a: null,
        };
    }
}
