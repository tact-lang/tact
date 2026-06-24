struct ContainsAddr {
    a: Address;
}

contract AddressFields {
    a: Address;
    b: ContainsAddr;

    init() {
        self.a = myAddress();
        self.b = ContainsAddr{a: myAddress()};
    }
}