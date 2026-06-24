struct AddressNest {
    a1: Address;
    a2: Address;
}

contract ManyAddresses {
    addrs: AddressNest;

    init() {
        self.addrs = AddressNest{
            a1: myAddress(),
            a2: myAddress()
        };
    }
}