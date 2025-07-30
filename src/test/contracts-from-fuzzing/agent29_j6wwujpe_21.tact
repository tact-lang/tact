struct AddressOnly {
    addr: Address;
}

contract AddressPersistence {
    saved: AddressOnly;

    init() {
        self.saved = AddressOnly{ addr: myAddress() };
    }
}