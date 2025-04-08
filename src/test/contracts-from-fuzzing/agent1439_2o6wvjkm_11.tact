struct AddrField {
    addr1: Address;
    addr2: Address;
}

contract ContractWithAddresses {
    a: AddrField;

    init() {
        self.a = AddrField{
            addr1: myAddress(),
            addr2: myAddress()
        };
    }
}