struct ManyAddresses {
    a1: Address;
    a2: Address;
    a3: Address;
}

contract AddrContract {
    addrs: ManyAddresses;
    init() {
        self.addrs = ManyAddresses{
            a1: myAddress(),
            a2: myAddress(),
            a3: myAddress(),
        };
    }
}