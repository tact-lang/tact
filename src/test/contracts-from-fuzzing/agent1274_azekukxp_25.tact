struct OptionalAddressStruct {
    addr: Address?;
}

contract OptionalAddress {
    f: OptionalAddressStruct;

    init() {
        self.f = OptionalAddressStruct {
            addr: null
        };
    }
}