struct AddressHolder {
    addr: Address;
    name: String;
}

contract AddressPersist {
    saved: AddressHolder;

    init() {
        self.saved = AddressHolder {
            addr: myAddress(),
            name: "my contract"
        };
    }
}