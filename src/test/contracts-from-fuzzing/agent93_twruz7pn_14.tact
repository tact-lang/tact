contract OptionalAddress {
    target: Address?;

    init() {
        self.target = myAddress();
    }
}