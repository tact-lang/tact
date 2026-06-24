struct AddrStruct {
    a: Address;
    b: Address?;
}

contract Test {
    data: AddrStruct;
    init() {
        self.data = AddrStruct{
            a: myAddress(),
            b: null
        };
    }
}
