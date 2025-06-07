struct AddrStruct {
    a: Address;
    b: Address?;
}

contract AddressPersistence {
    field: AddrStruct;

    init() {
        self.field = AddrStruct{
            a: myAddress(),
            b: null
        };
    }
}