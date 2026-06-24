struct AddressStruct {
    a1: Address;
    a2: Address;
    a3: Address;
}

contract AddressStructTest {
    data: AddressStruct;

    init() {
        self.data = AddressStruct {
            a1: myAddress(),
            a2: myAddress(),
            a3: myAddress()
        };
    }
}