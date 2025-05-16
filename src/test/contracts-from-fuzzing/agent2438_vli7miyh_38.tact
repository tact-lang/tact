struct WithAddress {
    addr: Address;
}

contract AddressHolder {
    a: WithAddress;

    init() {
        self.a = WithAddress{ addr: myAddress() };
    }
}
