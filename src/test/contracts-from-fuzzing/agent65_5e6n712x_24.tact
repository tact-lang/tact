struct OptionalAddress {
    addr1: Address?;
    addr2: Address?;
}

contract OptAddrTest {
    data: OptionalAddress;

    init() {
        self.data = OptionalAddress{
            addr1: null,
            addr2: myAddress()
        };
    }
}
