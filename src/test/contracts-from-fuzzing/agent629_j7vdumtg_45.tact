struct AddressStructOpt {
    a: Address?;
}

contract OptionalAddressDefaults {
    x: AddressStructOpt;

    init() {
        self.x = AddressStructOpt{ a: null };
    }
}