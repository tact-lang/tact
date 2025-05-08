contract OptionalAddressDefault {
    a: Address? = null;
    b: Address? = null;

    init() {
        self.a = null;
        self.b = null;
    }
}
