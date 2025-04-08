contract OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    d: String? = null;
    e: Int?;

    init() {
        self.e = 123;
    }
}
