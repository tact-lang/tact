struct WithAddress {
    a: Address;
}

contract AddressFieldTest {
    data: WithAddress;

    init() {
        self.data = WithAddress{ a: myAddress() };
    }
}