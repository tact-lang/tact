struct AddressStruct {
    addr: Address;
    label: String?;
}

contract AddressContract {
    entry: AddressStruct;

    init() {
        self.entry = AddressStruct{
            addr: myAddress(),
            label: null,
        };
    }
}