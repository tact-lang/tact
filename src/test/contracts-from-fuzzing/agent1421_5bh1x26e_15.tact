struct AddrStruct {
    a: Address? = null;
    b: Address? = null;
}

contract ContractWithOptAddresses {
    s: AddrStruct;

    init() {
        self.s = AddrStruct{};
    }
}