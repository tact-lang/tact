struct AddrWrap {
    sender: Address;
    owner: Address?;
}

contract AddressNested {
    data: AddrWrap;

    init() {
        self.data = AddrWrap{
            sender: myAddress(),
            owner: null,
        };
    }
}