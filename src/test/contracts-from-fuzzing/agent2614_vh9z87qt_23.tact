struct AddressStruct {
    a1: Address;
    a2: Address;
}

contract StructOfAddresses {
    data: AddressStruct;

    init() {
        self.data = AddressStruct{
            a1: myAddress(),
            a2: myAddress()
        };
    }
}