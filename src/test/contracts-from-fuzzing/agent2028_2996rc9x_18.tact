contract AddressFields {
    a: Address;
    b: Address;
    c: Address?;
    d: Address?;

    init() {
        self.a = myAddress();
        self.b = myAddress();
        self.c = null;
        self.d = null;
    }
}
