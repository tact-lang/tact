struct OptionalAddress {
    addr: Address?;
}

contract OptionalAddressTest {
    state: OptionalAddress;

    init() {
        self.state = OptionalAddress{
            addr: null,
        };
    }
}