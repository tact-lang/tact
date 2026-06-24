struct HasAddress {
    addr: Address;
    text: String;
}

contract AddressStructTest {
    foo: HasAddress;

    init() {
        self.foo = HasAddress{
            addr: myAddress(),
            text: "address"
        };
    }
}
