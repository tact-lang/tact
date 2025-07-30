struct Addresses {
    a: Address;
    b: Address;
    c: Address;
}

contract AddressVariants {
    addrs: Addresses;

    init() {
        let my = myAddress();
        self.addrs = Addresses{
            a: my,
            b: my,
            c: my
        };
    }
}