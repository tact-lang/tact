struct OptionalAddress {
    addr: Address?;
}

contract OptionalAddressField {
    saved: OptionalAddress;

    init() {
        self.saved = OptionalAddress{ addr: null };
    }
}