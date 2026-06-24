struct WithAddress {
    a1: Address;
    a2: Address;
}

contract AddressTest {
    data: WithAddress;

    init() {
        self.data = WithAddress{
            a1: myAddress(),
            a2: myAddress(),
        };
    }
}