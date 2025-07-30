struct OptAddr {
    a: Address?;
}

contract OptAddrField {
    addrField: OptAddr;
    init() {
        self.addrField = OptAddr{a: null};
    }
}