struct WrappedAddress {
    inner: Address;
}

contract AddressField {
    owner: WrappedAddress;

    init() {
        self.owner = WrappedAddress{ inner: myAddress() };
    }
}