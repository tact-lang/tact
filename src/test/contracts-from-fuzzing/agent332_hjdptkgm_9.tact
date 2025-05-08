struct AddrWrap {
    addr1: Address;
    addr2: Address?;
}

contract TestContract {
    a: AddrWrap;

    init() {
        self.a = AddrWrap{
            addr1: myAddress(),
            addr2: null
        };
    }
}