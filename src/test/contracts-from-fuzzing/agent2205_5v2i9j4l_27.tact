struct AddressOpt {
    addr: Address?;
}

contract OptionalAddr {
    f: AddressOpt;

    init() {
        self.f = AddressOpt{ addr: null };
    }
}