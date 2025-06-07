struct OptionalAddress {
    addr1: Address?;
    addr2: Address?;
    flag: Bool;
}

contract OptAddrTest {
    data: OptionalAddress;
    init() {
        self.data = OptionalAddress{
            addr1: null,
            addr2: null,
            flag: true,
        };
    }
}