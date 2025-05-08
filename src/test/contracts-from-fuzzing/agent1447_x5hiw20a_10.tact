contract OptionalAddress {
    maybe: Address?;

    init() {
        self.maybe = null;
    }
}