struct WithAddress {
    addr: Address;
    label: String;
}

contract AddressPersist {
    data: WithAddress;

    init() {
        self.data = WithAddress{
            addr: myAddress(),
            label: "me"
        };
    }
}
