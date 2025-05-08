struct AddressStruct {
    owner: Address;
    backup: Address?;
}

contract AddressStorage {
    state: AddressStruct;

    init() {
        self.state = AddressStruct{
            owner: myAddress(),
            backup: null
        };
    }
}