struct WithAddress {
    addr: Address;
}

contract AddressField {
    val: WithAddress;

    init() {
        self.val = WithAddress{addr: myAddress()};
    }
}