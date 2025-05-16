struct AddrStruct {
    a: Address;      
    b: Address?;
    c: Address;
    d: Address?;
}

contract TestC {
    addrs: AddrStruct;

    init() {
        self.addrs = AddrStruct{
            a: myAddress(),
            b: null,
            c: myAddress(),
            d: null
        };
    }
}