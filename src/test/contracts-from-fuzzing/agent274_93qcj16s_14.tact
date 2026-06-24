struct AddressStruct {
    addr: Address;
    optionalStr: String?;
}

contract AddressOptionalTest {
    info: AddressStruct;

    init() {
        self.info = AddressStruct{
            addr: myAddress(),
            optionalStr: null,
        };
    }
}