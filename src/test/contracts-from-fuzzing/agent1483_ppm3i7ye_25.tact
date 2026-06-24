struct OptionalAddress {
    addr: Address?;
}

contract OptionalAddressField {
    s: OptionalAddress;

    init() {
        self.s = OptionalAddress{ addr: null };
    }
}