struct AddressStruct {
    a1: Address;
    a2: Address;
    optA: Address?;
}

contract AddressPersist {
    data: AddressStruct;
    init() {
        self.data = AddressStruct {
            a1: myAddress(),
            a2: myAddress(),
            optA: null
        };
    }
}
