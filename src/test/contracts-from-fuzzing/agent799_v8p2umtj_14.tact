struct AddressStruct {
    addr1: Address;
    addr2: Address;
}

contract AddressInStruct {
    s: AddressStruct;

    init() {
        self.s = AddressStruct{
            addr1: myAddress(),
            addr2: myAddress()
        };
    }
}