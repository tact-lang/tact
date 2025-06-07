struct InnerAddr {
    addr2: Address;
}

struct OuterAddr {
    addr1: Address;
    nested: InnerAddr;
}

contract NestedAddresses {
    state: OuterAddr;

    init() {
        let a = myAddress();
        self.state = OuterAddr{
            addr1: a,
            nested: InnerAddr{ addr2: a }
        };
    }
}