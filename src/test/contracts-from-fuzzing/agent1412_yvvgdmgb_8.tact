struct AddrStruct {
    owner: Address;
    delegate: Address?;
    isEnabled: Bool;
    tokenId: Int?;
}

contract AddressOptions {
    info: AddrStruct;

    init() {
        self.info = AddrStruct{
            owner: myAddress(),
            delegate: null,
            isEnabled: true,
            tokenId: null
        };
    }
}