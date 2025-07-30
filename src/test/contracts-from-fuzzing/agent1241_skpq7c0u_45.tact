struct HasAddress {
    a: Address;
    b: Address;
    c: Address;
}

contract AddressPersist {
    store: HasAddress;

    init() {
        let addr = myAddress();
        self.store = HasAddress{ a: addr, b: addr, c: addr };
    }
}
