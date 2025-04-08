struct HasAddress {
    addr: Address;
}

contract StructAddressTest {
    s: HasAddress;

    init() {
        self.s = HasAddress{ addr: myAddress() };
    }
}