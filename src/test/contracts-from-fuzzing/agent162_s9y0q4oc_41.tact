contract OptionalAddresses {
    a: Address?;
    b: Address?;

    init() {
        self.a = null;
        self.b = null;
    }
}