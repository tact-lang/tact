struct HasAddressOpt {
    optAddr: Address?;
    plainAddr: Address;
}

contract OptionalAddressInside {
    info: HasAddressOpt;

    init() {
        self.info = HasAddressOpt{
            optAddr: null,
            plainAddr: myAddress(),
        };
    }
}