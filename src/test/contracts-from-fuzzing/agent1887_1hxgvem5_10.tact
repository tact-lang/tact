struct ContainsAddress {
    addr: Address;
    flag: Bool;
}

contract AddressTest {
    data: ContainsAddress;

    init() {
        self.data = ContainsAddress{
            addr: myAddress(),
            flag: true,
        };
    }
}