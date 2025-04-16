struct WrapAddressOpt {
    addr: Address?;
}

contract AddressFieldWrapOpt {
    f: WrapAddressOpt;

    init() {
        self.f = WrapAddressOpt{addr: null};
    }
}