struct ManyAddrs {
    a: Address;
    b: Address;
    c: Address;
    d: Address;
}

contract MultiAddressPersist {
    data: ManyAddrs;

    init() {
        let addr = myAddress();
        self.data = ManyAddrs { a: addr, b: addr, c: addr, d: addr };
    }
}