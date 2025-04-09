struct WithAddress {
    addr1: Address;
    addr2: Address;
}

contract AddressFields {
    f: WithAddress;
    init() {
        self.f = WithAddress{
            addr1: myAddress(),
            addr2: myAddress(),
        };
    }
}