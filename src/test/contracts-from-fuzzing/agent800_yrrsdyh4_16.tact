struct HasAddress {
    addr1: Address;
    addr2: Address?;
}

contract AddrPersist {
    st: HasAddress;
    init() {
        self.st = HasAddress{
            addr1: myAddress(),
            addr2: null,
        };
    }
}