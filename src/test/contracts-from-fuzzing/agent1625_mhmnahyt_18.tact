struct AddressStruct {
    addr: Address;
    flag: Bool;
}

contract AddressNested {
    s: AddressStruct;

    init() {
        self.s = AddressStruct{
            addr: myAddress(),
            flag: true,
        };
    }
}
