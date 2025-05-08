struct AddrOpt {
    addr: Address?;
}

contract OptionalAddressField {
    field: AddrOpt;
    init() {
        self.field = AddrOpt { addr: null };
    }
}