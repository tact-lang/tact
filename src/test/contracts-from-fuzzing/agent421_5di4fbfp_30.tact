struct AddressStruct {
    a: Address;
    b: Address;
}

contract AddressFields {
    addr: AddressStruct;

    init() {
        self.addr = AddressStruct{ a: myAddress(), b: myAddress() };
    }
}