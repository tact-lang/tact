struct AddressAndString {
    addr: Address;
    str: String;
}

contract StorageAddressAndString {
    data: AddressAndString;

    init() {
        self.data = AddressAndString{
            addr: myAddress(),
            str: "sample"
        };
    }
}