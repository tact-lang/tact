contract OptionalStringAndAddress {
    s: String?;
    a: Address?;

    init() {
        self.s = null;
        self.a = null;
    }
}