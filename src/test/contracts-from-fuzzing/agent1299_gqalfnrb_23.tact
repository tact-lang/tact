struct AddrWrap {
    a: Address;
    n: Int;
}

contract AddrHolder {
    wrap: AddrWrap;

    init() {
        self.wrap = AddrWrap{
            a: myAddress(),
            n: 999
        };
    }
}