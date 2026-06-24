contract PersistentAddress {
    addressField: Address;
    optAddress: Address?;

    init() {
        self.addressField = myAddress();
        self.optAddress = null;
    }
}