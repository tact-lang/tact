struct AddrWrap {
    a: Address;
    flag: Bool?;
}

contract AddressStructFieldTest {
    info: AddrWrap;
    init() {
        self.info = AddrWrap{a: myAddress(), flag: null};
    }
}