struct AddressHolder {
    a: Address;
}

contract AddressPersistent {
    f: AddressHolder;

    init() {
        self.f = AddressHolder {
            a: myAddress()
        };
    }
}