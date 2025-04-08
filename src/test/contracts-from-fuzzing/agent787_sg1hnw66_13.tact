struct OptAddrs {
    a: Address?;
    b: Address?;
    c: Address?;
    d: Address?;
    e: Address?;
}

contract TestContract {
    addrs: OptAddrs = OptAddrs{a: null,b: null,c: null,d: null,e: null};

    init() {
        self.addrs = OptAddrs{
            a: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            b: null,
            c: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            d: null,
            e: null
        };
    }
}