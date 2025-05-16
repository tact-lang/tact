struct PersistAddress {
    addr: Address;
    optAddr: Address?;
}

contract AddressStorage {
    a: PersistAddress;

    init() {
        self.a = PersistAddress{
            addr: myAddress(),
            optAddr: null
        };
    }
}