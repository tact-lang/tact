struct HasAddress {
    addr: Address;
}

contract AddressField {
    a: HasAddress;
    init() {
        self.a = HasAddress{ addr: myAddress() };
    }
}