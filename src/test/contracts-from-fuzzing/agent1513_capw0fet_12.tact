struct WithAddress {
    addr1: Address;
    addr2: Address;
}

contract AddressesInStruct {
    addrs: WithAddress;

    init() {
        self.addrs = WithAddress{
            addr1: myAddress(),
            addr2: myAddress()
        };
    }
}