struct AddressNest {
    a1: Address;
    a2: Address?;
}

contract AddressFields {
    addrs: AddressNest;

    init() {
        self.addrs = AddressNest{
            a1: myAddress(),
            a2: null
        };
    }
}