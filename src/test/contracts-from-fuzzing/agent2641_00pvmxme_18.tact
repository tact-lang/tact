struct HasAddress {
    a: Address;
    b: Address?;
    c: Address;
}

contract AddressFieldsTest {
    data: HasAddress;

    init() {
        self.data = HasAddress{
            a: myAddress(),
            b: null,
            c: myAddress(),
        };
    }
}