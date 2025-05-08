struct AddressStruct {
    addr: Address;
    name: String;
    flag: Bool;
}

contract AddressPersist {
    s: AddressStruct;

    init() {
        self.s = AddressStruct{
            addr: myAddress(),
            name: "abc",
            flag: false,
        };
    }
}