struct AddrWrap {
    addr: Address;
}

contract AddressPersistentTest {
    a: AddrWrap;

    init() {
        self.a = AddrWrap{
            addr: myAddress()
        };
    }
}
