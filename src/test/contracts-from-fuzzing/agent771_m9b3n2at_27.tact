struct AddrWrap {
    addr: Address;
    maybeAddr: Address?;
}

contract OptionalAddressStruct {
    a: AddrWrap;

    init() {
        self.a = AddrWrap{
            addr: myAddress(),
            maybeAddr: null,
        };
    }
}