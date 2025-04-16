struct ContainsAddress {
    addr: Address;
}

contract AddressTest {
    data: ContainsAddress;

    init() {
        self.data = ContainsAddress{
            addr: myAddress()
        };
    }
}