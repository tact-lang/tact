struct OptionalAddress {
    addr: Address?;
}

contract AddressOptionalContract {
    optAddr: OptionalAddress;

    init() {
        self.optAddr = OptionalAddress{addr: null};
    }
}