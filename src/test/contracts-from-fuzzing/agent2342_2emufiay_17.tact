struct AddressStruct {
    addr: Address;
    optAddr: Address?;
}

contract AddressFields {
    ad: AddressStruct;

    init() {
        self.ad = AddressStruct{
            addr: myAddress(),
            optAddr: null
        };
    }
}