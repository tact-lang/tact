struct AddressStruct {
    a: Address;
}

contract SetAddressInInit {
    addrStruct: AddressStruct;
    optAddr: Address?;

    init() {
        self.addrStruct = AddressStruct{ a: myAddress() };
        self.optAddr = myAddress();
    }
}