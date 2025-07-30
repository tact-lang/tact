contract OptionalAddress {
    owner: Address?;

    init() {
        self.owner = null;
    }
}