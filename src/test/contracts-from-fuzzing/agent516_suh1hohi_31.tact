struct NestedAddresses {
    addr1: Address;
    addr2: Address;
    boolVal: Bool;
}

contract AddrComboTest {
    s: NestedAddresses;

    init() {
        self.s = NestedAddresses{
            addr1: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            addr2: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            boolVal: false
        };
    }
}
