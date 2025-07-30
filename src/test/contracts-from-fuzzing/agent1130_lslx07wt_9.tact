contract AddressStringFields {
    a: Address;
    s: String;

    init() {
        self.a = myAddress();
        self.s = "test";
    }
}