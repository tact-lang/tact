struct ManyAddresses {
    a1: Address;
    a2: Address;
    a3: Address;
    a4: Address;
    a5: Address;
}

contract TestContract {
    addrs: ManyAddresses;

    init() {
        let addr = myAddress();
        self.addrs = ManyAddresses{
            a1: addr,
            a2: addr,
            a3: addr,
            a4: addr,
            a5: addr,
        };
    }
}