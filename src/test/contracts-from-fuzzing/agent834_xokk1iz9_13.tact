contract OptDefaults {
    a: Int?; // default is null
    b: Bool? = null;
    c: String? = null;
    d: Address?;

    init() {
        self.a = null;
        self.d = null;
    }
}
