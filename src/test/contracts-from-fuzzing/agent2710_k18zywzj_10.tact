contract OptionalFieldsDefaults {
    a: Int?; // defaults to null
    b: Bool? = null;
    c: Address?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}