struct AddrWrap {
    addr: Address;
}

contract UseAddress {
    s: AddrWrap;
    init() {
        self.s = AddrWrap{ addr: myAddress() };
    }
}