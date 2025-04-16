struct AddrWrap {
    addr: Address;
    optAddr: Address?;
}

contract HasAddresses {
    data: AddrWrap;

    init() {
        self.data = AddrWrap{ addr: myAddress(), optAddr: null };
    }
}