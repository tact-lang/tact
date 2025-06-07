contract OptionalAddresses {
    a1: Address?;
    a2: Address?;
    a3: Address?;

    init() {
        self.a1 = null;
        self.a2 = null;
        self.a3 = null;
    }
}