struct OptionalAddresses {
    a1: Address?;
    a2: Address?;
    a3: Address?;
}

contract MultiOptAddress {
    data: OptionalAddresses;

    init() {
        self.data = OptionalAddresses{
            a1: null,
            a2: null,
            a3: null,
        };
    }
}