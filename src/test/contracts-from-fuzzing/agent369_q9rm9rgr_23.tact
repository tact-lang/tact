contract OptionalAddresses {
    a1: Address?;
    a2: Address?;

    init() {
        self.a1 = null;
        self.a2 = myAddress();
    }
}