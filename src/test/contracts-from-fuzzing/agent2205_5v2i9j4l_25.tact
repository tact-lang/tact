struct HasAddress {
    addr: Address;
}

contract AddressField {
    s: HasAddress;

    init() {
        self.s = HasAddress{ addr: myAddress() };
    }
}