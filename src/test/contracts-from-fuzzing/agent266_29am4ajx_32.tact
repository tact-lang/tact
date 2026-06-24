struct WithAddress {
    addr: Address;
    optAddr: Address?;
}

contract AddressFields {
    data: WithAddress;

    init() {
        self.data = WithAddress{
            addr: myAddress(),
            optAddr: null
        };
    }
}