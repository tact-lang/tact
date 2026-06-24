struct OptionalAddress {
    a1: Address?;
    a2: Address?;
    a3: Address?;
}

contract AddressOpt {
    data: OptionalAddress;

    init() {
        self.data = OptionalAddress{
            a1: null,
            a2: null,
            a3: null,
        };
    }
}
