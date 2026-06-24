struct Addresses {
    a: Address;
    b: Address?;
}

contract AddressFields {
    vals: Addresses;
    init() {
        self.vals = Addresses{
            a: myAddress(),
            b: null
        };
    }
}