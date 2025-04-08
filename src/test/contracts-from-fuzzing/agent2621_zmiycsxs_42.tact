contract Test {
    addressField: Address;
    optAddressField: Address?;
    init() {
        self.addressField = myAddress();
        self.optAddressField = null;
    }
}