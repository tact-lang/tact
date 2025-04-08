struct OptionalAddresses {
    addr1: Address?;
    addr2: Address?;
    addr3: Address?;
}

contract OptionalAddressTest {
    data: OptionalAddresses;

    init() {
        self.data = OptionalAddresses{
            addr1: null,
            addr2: null,
            addr3: null
        };
    }
}