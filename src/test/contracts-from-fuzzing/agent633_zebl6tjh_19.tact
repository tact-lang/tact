struct AddressStruct {
    addr1: Address;
    addr2: Address?;
}

contract AddrHolder {
    st: AddressStruct;

    init() {
        self.st = AddressStruct{
            addr1: myAddress(),
            addr2: null
        };
    }
}