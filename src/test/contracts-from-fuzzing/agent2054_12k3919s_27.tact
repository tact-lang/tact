struct AddressFields {
    a1: Address;
    a2: Address;
}

contract ManyAddresses {
    data: AddressFields = AddressFields{
        a1: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
        a2: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c")
    };
}