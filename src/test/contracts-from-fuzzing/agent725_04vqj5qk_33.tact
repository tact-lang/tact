contract OptionalMixDefaults {
    a: Int? = null;
    b: Bool?;
    c: String? = null;
    d: Address?;

    init() {
        self.b = null;
        self.d = null;
    }
}