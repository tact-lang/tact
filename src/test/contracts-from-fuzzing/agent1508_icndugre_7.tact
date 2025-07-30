struct Addr {
    addr: Address;
    comment: String;
}

contract ManyAddresses {
    a1: Addr;
    a2: Addr;
    a3: Addr;

    init() {
        self.a1 = Addr{
            addr: myAddress(),
            comment: "one"
        };
        self.a2 = Addr{
            addr: myAddress(),
            comment: "two"
        };
        self.a3 = Addr{
            addr: myAddress(),
            comment: "three"
        };
    }
}
