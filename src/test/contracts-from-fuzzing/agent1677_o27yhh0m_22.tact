contract OptionalAddresses {
    from: Address?;
    to: Address?;

    init() {
        self.from = null;
        self.to = null;
    }
}