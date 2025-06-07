struct AddressStruct {
    target: Address;
}

contract AddressFieldTest {
    addr: AddressStruct;

    init() {
        self.addr = AddressStruct{ target: myAddress() };
    }
}