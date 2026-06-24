struct AddressStruct {
    addr: Address;
}

contract AddressField {
    s: AddressStruct;

    init() {
        self.s = AddressStruct{
            addr: myAddress()
        };
    }
}