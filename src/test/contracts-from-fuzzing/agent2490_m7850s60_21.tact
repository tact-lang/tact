struct AddressStruct {
    addr: Address;
    optAddr: Address?;
}

contract AddressFieldTest {
    data: AddressStruct;

    init() {
        self.data = AddressStruct{
            addr: myAddress(),
            optAddr: null,
        };
    }
}