struct AddressStruct {
    addressA: Address;
    addressB: Address;
    optionalAddress: Address?;
}

contract AddressStorage {
    data: AddressStruct;

    init() {
        self.data = AddressStruct{
            addressA: myAddress(),
            addressB: myAddress(),
            optionalAddress: null
        };
    }
}