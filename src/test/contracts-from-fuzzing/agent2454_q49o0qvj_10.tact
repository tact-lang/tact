struct AddrLayer {
    addr1: Address;
    addr2: Address;
}

struct NestedAddr {
    outer: AddrLayer;
    inner: AddrLayer;
}

contract AddressNest {
    storage: NestedAddr;

    init() {
        self.storage = NestedAddr{
            outer: AddrLayer{addr1:myAddress(), addr2:myAddress()},
            inner: AddrLayer{addr1:myAddress(), addr2:myAddress()},
        };
    }
}