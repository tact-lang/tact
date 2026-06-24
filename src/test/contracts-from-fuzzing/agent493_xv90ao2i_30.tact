struct AddressStruct {
    a: Address;
    b: Address;
}

contract ManyAddresses {
    s: AddressStruct;

    init() {
        self.s = AddressStruct{
            a: myAddress(),
            b: myAddress()
        };
    }
}