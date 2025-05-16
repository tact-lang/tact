contract SingleOptionalAddress {
    a: Address?;

    init() {
        self.a = null;
    }
}