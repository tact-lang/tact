struct AddressStruct {
    addr1: Address;
    addr2: Address;
    optAddr1: Address?;
    optAddr2: Address?;
}

contract TestContract {
    data: AddressStruct;
    init() {
        self.data = AddressStruct{
            addr1: myAddress(),
            addr2: myAddress(),
            optAddr1: null,
            optAddr2: myAddress(),
        };
    }
}
