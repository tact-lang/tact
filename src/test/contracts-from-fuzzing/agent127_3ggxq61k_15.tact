struct HasAddress {
    addr: Address;
}

contract AddressStructField {
    data: HasAddress;
    init() {
        self.data = HasAddress{ addr: myAddress() };
    }
}