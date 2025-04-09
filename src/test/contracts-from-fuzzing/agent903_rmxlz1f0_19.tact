struct AddrStruct {
    a1: Address;
    a2: Address;
}

contract StoreAddresses {
    s: AddrStruct;

    init() {
        let dummy = myAddress();
        self.s = AddrStruct{ a1: dummy, a2: dummy };
    }
}