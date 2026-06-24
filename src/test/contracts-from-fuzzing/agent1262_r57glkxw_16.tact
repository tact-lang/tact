struct AddrStruct {
    a: Address;
    b: Address;
    flag: Bool;
}

contract AddressTest {
    d: AddrStruct;

    init() {
        self.d = AddrStruct{
            a: myAddress(),
            b: myAddress(),
            flag: false,
        };
    }
}