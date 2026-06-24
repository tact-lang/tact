struct Addresses {
    addr1: Address;
    addr2: Address;
    addr3: Address;
}

contract TestAddresses {
    s: Addresses;
    init() {
        self.s = Addresses{
            addr1: myAddress(),
            addr2: myAddress(),
            addr3: myAddress(),
        };
    }
}