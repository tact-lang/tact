struct ManyAddresses {
    a: Address;
    b: Address;
    c: Address;
    d: Address;
    e: Address;
    f: Address;
    g: Address;
    h: Address;
    i: Address;
    j: Address;
}

contract TestContract {
    addrs: ManyAddresses;

    init() {
        let addr = myAddress();
        self.addrs = ManyAddresses{
            a: addr, b: addr, c: addr, d: addr, e: addr,
            f: addr, g: addr, h: addr, i: addr, j: addr
        };
    }
}