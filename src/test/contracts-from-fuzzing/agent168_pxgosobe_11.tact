struct AddrTest {
    addr1: Address;
    addr2: Address?;
}

contract TestAddressOptional {
    a: AddrTest;

    init() {
        self.a = AddrTest{
            addr1: myAddress(),
            addr2: null,
        };
    }
}