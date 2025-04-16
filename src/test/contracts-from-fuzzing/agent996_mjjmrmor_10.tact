struct AddressStruct {
    addr1: Address;
    addr2: Address;
    addr3: Address;
}

contract TestStorage {
    addresses: AddressStruct;

    init() {
        self.addresses = AddressStruct{
            addr1: myAddress(),
            addr2: myAddress(),
            addr3: myAddress(),
        };
    }
}