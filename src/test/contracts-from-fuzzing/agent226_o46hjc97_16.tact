struct AddressStruct {
    owner: Address;
    backup: Address?;
}

contract TestAddresses {
    data: AddressStruct;

    init() {
        self.data = AddressStruct{
            owner: myAddress(),
            backup: null
        };
    }
}
