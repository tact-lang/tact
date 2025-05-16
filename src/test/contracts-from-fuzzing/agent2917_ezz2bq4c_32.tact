contract OptionalAddressField {
    owner: Address?;

    init() {
        self.owner = null;
    }
}
