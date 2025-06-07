struct AddressHolder {
    addr: Address;
    label: String;
}

contract StoreAddress {
    data: AddressHolder;

    init() {
        self.data = AddressHolder{
            addr: myAddress(),
            label: "My Address",
        };
    }
}
