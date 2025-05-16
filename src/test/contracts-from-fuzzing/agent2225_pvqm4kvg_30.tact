struct AddressStruct {
    a: Address;
}

contract AddrInStruct {
    data: AddressStruct;

    init() {
        self.data = AddressStruct{ a: myAddress() };
    }
}