struct WithAddress {
    addr: Address;
    optAddr: Address?;
}

contract AddressFields {
    val: WithAddress;

    init() {
        self.val = WithAddress{ addr: myAddress(), optAddr: null };
    }
}