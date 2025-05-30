contract OptionalAddressField {
    maybeAddr: Address?;

    init() {
        self.maybeAddr = null;
    }
}