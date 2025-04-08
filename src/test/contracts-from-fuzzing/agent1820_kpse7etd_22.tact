struct AddrWrap {
    aa: Address;
}

contract TestContract {
    addrField: AddrWrap;
    init() {
        self.addrField = AddrWrap{
            aa: myAddress(),
        };
    }
}