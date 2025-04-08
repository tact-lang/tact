struct OptionalAddr {
    addr: Address?;
}

contract OptionalAddressField {
    v: OptionalAddr;

    init() {
        self.v = OptionalAddr{ addr: null };
    }
}