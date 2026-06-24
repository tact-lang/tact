struct HasAddress {
    addr1: Address;
    addr2: Address?;
}

contract AddrTest {
    h: HasAddress;

    init() {
        self.h = HasAddress{
            addr1: myAddress(),
            addr2: null
        };
    }
}