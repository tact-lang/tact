struct HasAddress {
    addr: Address;
}

contract AddressStructField {
    s: HasAddress;
    init() {
        self.s = HasAddress{ addr: myAddress() };
    }
}