struct HasAddress {
    a: Address;
}

contract AddressFieldTest {
    val: HasAddress;

    init() {
        self.val = HasAddress{ a: myAddress() };
    }
}