struct ContainsAddress {
    addr: Address;
    maybeAddr: Address?;
}

contract AddressTest {
    data: ContainsAddress;

    init() {
        self.data = ContainsAddress{
            addr: myAddress(),
            maybeAddr: null,
        };
    }
}