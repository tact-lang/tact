struct WithAddress {
    addr: Address;
    flag: Bool;
}

contract AddressField {
    data: WithAddress;
    init() {
        self.data = WithAddress{addr: myAddress(), flag: true};
    }
}