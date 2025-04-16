struct WithAddresses {
    addr: Address;
    optionalAddr: Address?;
}

contract AddressInStruct {
    s: WithAddresses;
    init() {
        self.s = WithAddresses{
            addr: myAddress(),
            optionalAddr: null
        };
    }
    receive() {}
}