struct WithAddress {
    addr: Address;
}

contract AddressStorage {
    s: WithAddress;
    init() {
        self.s = WithAddress{ addr: myAddress() };
    }
}