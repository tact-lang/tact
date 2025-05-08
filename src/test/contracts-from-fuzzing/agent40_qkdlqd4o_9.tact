struct AddressStruct {
    a1: Address;
    a2: Address;
}

contract StorageAddresses {
    vals: AddressStruct;

    init() {
        let m = myAddress();
        self.vals = AddressStruct{ a1:m, a2:m };
    }
}