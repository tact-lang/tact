struct OptAddr {
    a: Address?;
}

contract OptionalAddressField {
    addrWrap: OptAddr;
    init() {
        self.addrWrap = OptAddr{a:null};
    }
}