contract AddressStringFields {
    owner: Address;
    name: String;

    init() {
        self.owner = myAddress();
        self.name = "test";
    }
}