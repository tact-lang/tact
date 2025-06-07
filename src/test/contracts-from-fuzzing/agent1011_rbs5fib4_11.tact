struct AddressStruct {
    addr1: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    addr2: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
}

contract AddressFields {
    data: AddressStruct;

    init() {
        self.data = AddressStruct{};
    }
}