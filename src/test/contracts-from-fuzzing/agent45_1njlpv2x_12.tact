struct StructWithAddresses {
    a1: Address;
    a2: Address;
    a3: Address;
}

contract AddrDeep {
    s: StructWithAddresses;

    init() {
        let addr = myAddress();
        self.s = StructWithAddresses{ a1: addr, a2: addr, a3: addr };
    }
}
