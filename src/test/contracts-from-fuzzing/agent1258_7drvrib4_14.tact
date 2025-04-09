struct NestedAddresses {
    a1: Address;
    a2: Address?;
    a3: Address;
}

contract AddressStruct {
    addrStruct: NestedAddresses;

    init() {
        self.addrStruct = NestedAddresses{
            a1: myAddress(),
            a2: null,
            a3: myAddress()
        };
    }
}