contract NullableAddress {
    a: Address?;
    init() {
        self.a = null;
    }
}