contract OptionalAddresses {
    a: Address?;
    b: Address?;
    c: Address?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}