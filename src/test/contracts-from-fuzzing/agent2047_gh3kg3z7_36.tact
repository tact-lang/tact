contract OptionalAddressDefaults {
    other: Address? = null;

    init() {
        self.other = null;
    }
}