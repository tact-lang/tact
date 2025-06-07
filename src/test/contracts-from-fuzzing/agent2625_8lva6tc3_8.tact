struct OptionalAddresses {
    addr1: Address?;
    addr2: Address?;
    addr3: Address?;
    addr4: Address?;
}

contract OptionAddrContract {
    state: OptionalAddresses;

    init() {
        self.state = OptionalAddresses{
            addr1: null,
            addr2: null,
            addr3: null,
            addr4: null
        };
    }
}
