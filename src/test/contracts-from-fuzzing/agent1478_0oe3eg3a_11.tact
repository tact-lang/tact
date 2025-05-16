struct AddressStruct {
    addr: Address;
    flag: Bool;
    count: Int;
}

contract AddressFields {
    data: AddressStruct;
    init() {
        self.data = AddressStruct{
            addr: myAddress(),
            flag: true,
            count: 99
        };
    }
}
