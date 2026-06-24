struct AddressStruct {
    who: Address;
    label: String;
}

contract AddressStorage {
    addrInfo: AddressStruct;

    init() {
        self.addrInfo = AddressStruct{
            who: myAddress(),
            label: "Myself"
        };
    }
}