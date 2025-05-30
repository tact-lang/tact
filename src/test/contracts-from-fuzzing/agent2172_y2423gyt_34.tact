struct OptionalAddress {
    addr: Address?;
}

contract OptAddrField {
    wallet: OptionalAddress;

    init() {
        self.wallet = OptionalAddress{ addr: null };
    }
}