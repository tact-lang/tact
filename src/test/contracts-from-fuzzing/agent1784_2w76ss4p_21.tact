struct HasAddress {
    addr: Address;
}

contract AddressPersistent {
    val: HasAddress;

    init() {
        self.val = HasAddress{ addr: myAddress() };
    }
}