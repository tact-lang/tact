contract OptionalAddressDefaults {
    a1: Address? = null;
    a2: Address?;
    a3: Address?;
    a4: Address? = null;

    init() {
        self.a1 = null;
        self.a2 = null;
        self.a3 = myAddress();
        self.a4 = null;
    }
}