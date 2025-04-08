struct AddressWrap {
    addr: Address;
}

contract StoreAddressWrap {
    a: AddressWrap;

    init() {
        self.a = AddressWrap { addr: myAddress() };
    }
}