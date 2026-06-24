struct WithAddress {
    addr: Address;
    extra: Int;
}

contract AddressFieldTest {
    data: WithAddress;

    init() {
        self.data = WithAddress{
            addr: myAddress(),
            extra: 77,
        };
    }
}