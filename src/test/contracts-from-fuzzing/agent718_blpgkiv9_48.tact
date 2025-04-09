contract OptionalBuilderAndAddress {
    b: Builder?;
    a: Address?;
    init() {
        self.b = null;
        self.a = null;
    }
}