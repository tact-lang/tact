struct AddressStruct {
    a: Address;
    optA: Address?;
}

contract ContractAddresses {
    addrData: AddressStruct;

    init() {
        self.addrData = AddressStruct{
            a: myAddress(),
            optA: null
        };
    }
}