struct AddressContainer {
    a1: Address;
    a2: Address;
}

contract ManyAddresses {
    ad: AddressContainer;

    init() {
        let addr = myAddress();
        self.ad = AddressContainer{ a1: addr, a2: addr };
    }
}