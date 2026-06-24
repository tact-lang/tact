contract OnlyAddress {
    a: Address;

    init() {
        self.a = myAddress();
    }
}
