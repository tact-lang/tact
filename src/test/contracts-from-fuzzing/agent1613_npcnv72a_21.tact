contract OnlyAddress {
    a: Address;
    b: Address?;

    init() {
        self.a = myAddress();
        self.b = null;
    }
}
