struct AddrStruct {
    a1: Address;
    a2: Address?;
    a3: Address;
    a4: Address?;
}

contract TestContract {
    addrs: AddrStruct;

    init() {
        self.addrs = AddrStruct{
            a1: myAddress(),
            a2: null,
            a3: myAddress(),
            a4: null
        };
    }
}