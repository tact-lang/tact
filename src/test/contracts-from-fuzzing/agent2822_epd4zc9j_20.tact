struct AddressDefaults {
    a1: Address?;
    a2: Address?;
    a3: Address?;
}

contract NullAddressFields {
    x: AddressDefaults;
    init() {
        self.x = AddressDefaults{};
    }
}