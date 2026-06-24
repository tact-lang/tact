struct WithAddress {
    addr: Address;
}

contract TestAddressField {
    d: WithAddress;

    init() {
        self.d = WithAddress{ addr: myAddress() };
    }
}