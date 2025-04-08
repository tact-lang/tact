struct OptionalAddresses {
    a1: Address?;
    a2: Address?;
    a3: Address?;
    a4: Address?;
    a5: Address?;
}

contract NullableAddresses {
    addrs: OptionalAddresses;

    init() {
        self.addrs = OptionalAddresses{
            a1: null,
            a2: null,
            a3: null,
            a4: null,
            a5: null
        };
    }
}