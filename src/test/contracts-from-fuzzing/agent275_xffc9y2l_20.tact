struct HasAddress {
    addr: Address;
}

contract AddressInStruct {
    data: HasAddress;

    init() {
        self.data = HasAddress{ addr: myAddress() };
    }
}