struct AddressContainer {
    addr1: Address;
    addr2: Address;
    addr3: Address;
}

contract AddressStructField {
    nested: AddressContainer;

    init() {
        self.nested = AddressContainer{
            addr1: myAddress(),
            addr2: myAddress(),
            addr3: myAddress()
        };
    }
}
