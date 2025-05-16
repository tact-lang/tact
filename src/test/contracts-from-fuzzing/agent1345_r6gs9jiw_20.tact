struct AddressStruct {
    a: Address;
}

contract AddressFieldTest {
    foo: AddressStruct;

    init() {
        self.foo = AddressStruct{
            a: myAddress()
        };
    }
}