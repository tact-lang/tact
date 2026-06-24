struct AddrWrap {
    addr: Address;
    flag: Bool;
}

contract Test10 {
    stored: AddrWrap;

    init() {
        self.stored = AddrWrap{
            addr: myAddress(),
            flag: true
        };
    }
}